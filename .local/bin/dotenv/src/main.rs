//! dotenv: Environment Variable Exporter
//!
//! This program loads environment variables from a YAML file named `.dotenv` located in the user's home directory.
//! It parses the YAML file and prints each variable as a shell export statement, supporting both scalar string values and arrays (which are rendered as colon-separated strings, e.g., for PATH-like variables).
//!
//! Usage:
//!   - Place a `.dotenv` YAML file in your home directory with key-value pairs or arrays.
//!   - Run this program to output shell export statements for each variable.

use dirs; // Provides functions to get common directories (like home, config, etc.)
use std::error::Error; // Trait for error handling in Rust
use std::fs::File; // For working with files (open, create, etc.)
use std::io::Read; // Trait for reading from files and other sources
use yaml_rust::yaml::Hash; // Hash type used for YAML mapping in yaml-rust
use yaml_rust::YamlLoader; // Function to load and parse YAML documents

// Configuration file name in the user's home directory
const CONF_FILE_NAME: &str = ".dotenv";

// Returns the current user's home directory as a `String`, if available.
//
// This function uses the `dirs` crate to obtain the home directory path.
// It returns `None` if the home directory cannot be determined or if the path
// cannot be converted to a UTF-8 string.
fn get_home_directory() -> Option<String> {
    Some(dirs::home_dir()?.to_str()?.to_string())
}

/// Loads environment variables from a YAML file in the user's home directory.
///
/// This function attempts to locate and open a `.dotenv` YAML file in the current user's home directory.
/// It parses the file and returns its contents as a `yaml_rust::yaml::Hash`.
///
/// # Returns
///
/// * `Ok(Hash)` containing the key-value pairs from the YAML file if successful.
/// * `Err(Box<dyn Error>)` if the home directory cannot be determined, the file cannot be read, or the YAML is invalid.
fn get_env_vars() -> Result<Hash, Box<dyn Error>> {
    // get home directory
    let home_dir =
        get_home_directory().ok_or("couldn't determine home directory from environment")?;

    // load YAML file
    let conf_file_path = format!("{}/{}", home_dir, CONF_FILE_NAME);
    let mut conf_file = File::open(&conf_file_path)?;
    let mut conf_file_data = String::new();
    conf_file.read_to_string(&mut conf_file_data)?;

    let yaml_docs = YamlLoader::load_from_str(&conf_file_data)?;
    let yaml_first_doc = &yaml_docs[0];

    // convert first document to hash table
    let out_hash = yaml_first_doc
        .clone()
        .into_hash()
        .ok_or(format!("invalid configuration file: {}", &conf_file_path))?;

    // return the hash table
    Ok(out_hash)
}

// Macro to print a shell-style export statement for a variable and its value.
//
// # Arguments
//
// * `$name` - The name of the variable (expression).
// * `$value` - The value to assign to the variable (expression).
//
// # Example
//
// ```rust
// print_value!("PATH", "/usr/bin");
// ```
macro_rules! print_value {
    ($name:expr, $value:expr) => {
        println!("export {}=\"{}\"", $name, $value);
    };
}

fn main() -> Result<(), Box<dyn Error>> {
    // 1. get a hash table from the YAML configuration file
    let env_vars = get_env_vars()?;

    // 2. render each value in the resulting hash table as a shell export statement
    for (k, v) in env_vars.iter() {
        if let Some(name) = k.as_str() {
            // array values are translated to colon-separated strings
            // (e.g., PATH-like variables)
            if v.is_array() {
                // decode array from YAML data
                let v_ar = v.as_vec().unwrap();
                // note: optionally, consider this
                // .ok_or(format!("couldn't decode array: {}", name))?;

                // build colon-separated string from array values
                let mut final_value = String::new();
                for value in v_ar {
                    // all values in the array must be strings
                    if let Some(value) = value.as_str() {
                        final_value.push_str(&format!("{}:", value));
                    }
                }
                final_value.pop(); // remove trailing colon
                print_value!(name, &final_value); // print export statement
            } else {
                // scalar values are printed as-is
                // the ony supported scalar type is string
                if let Some(value) = v.as_str() {
                    print_value!(name, value); // print export statement
                }
            }
        }
    }

    Ok(())
}
