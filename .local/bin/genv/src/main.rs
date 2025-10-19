use dirs;
use std::error::Error;
use std::fs::File;
use std::io::Read;
use yaml_rust::YamlLoader;
use yaml_rust::yaml::Hash;

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
    let conf_file_path = format!("{}/.dotenv", home_dir);
    let mut conf_file = File::open(&conf_file_path)?;
    let mut conf_file_data = String::new();
    conf_file.read_to_string(&mut conf_file_data)?;

    let yaml_docs = YamlLoader::load_from_str(&conf_file_data)?;
    let yaml_first_doc = &yaml_docs[0];

    let out_hash = yaml_first_doc
        .clone()
        .into_hash()
        .ok_or(format!("invalid YAML file: {}", &conf_file_path))?;

    // return the hash table
    Ok(out_hash)
}

fn main() -> Result<(), Box<dyn Error>> {
    // 1. get a hash table from the YAML configuration file
    let env_vars = get_env_vars()?;

    // 2. render each value in the resulting hash table as a shell export statement
    for (k, v) in env_vars.iter() {
        let k_str = k.as_str();
        let v_str = v.as_str();

        if let Some(name) = k_str {
            if let Some(value) = v_str {
                println!("export {}={}", name, value);
            }
        }
    }

    Ok(())
}
