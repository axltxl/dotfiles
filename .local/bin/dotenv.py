#!/usr/bin/env python3
##################################################################
# dot-env: export environment variables via a YAML file
# based on: https://gist.github.com/SteveBenner/588fff3e54636f3d8297
##################################################################

import os
import sys
import yaml
from pathlib import Path

# forbidden environment variables (cannot be overwritten)
FORBIDDEN_ENVS = {
    "DOT_HOME",
    "DOT_PATH",
    "DOT_ENV_CFG",
    "DOT_ENV_OUT",
    "PATH",
    "TERM",
    "TERMINFO",
    "CPATH",
    "LIBRARY_PATH",
    "LD_RUN_PATH",
    "PKG_CONFIG_PATH",
}


def print_warn(msg: str):
    print(f"WARNING: {msg}", file=sys.stderr)


def print_err(msg: str):
    print(f"ERROR: {msg}", file=sys.stderr)


def main():
    conf_file = f"{os.getenv('HOME')}/.dotenv"
    if not conf_file:
        print_err("DOT_ENV_CFG is not set")
        sys.exit(1)

    conf_path = Path(conf_file).expanduser().resolve()

    if not conf_path.exists():
        print_err(f"Invalid or non-existent configuration file: {conf_path}")
        sys.exit(1)

    try:
        with open(conf_path, "r", encoding="utf-8") as f:
            vars_map = yaml.safe_load(f)
    except Exception as e:
        print_err(f"Error reading configuration file {conf_path}: {e}")
        sys.exit(1)

    if not vars_map:
        return

    for varname, value in vars_map.items():
        # skip forbidden vars
        if varname in FORBIDDEN_ENVS:
            print_warn(f"'{varname}' shouldn't be overwritten, ignoring ...")
            continue

        # normalize values
        if isinstance(value, (str, int)):
            val = str(value)
        elif isinstance(value, list):
            val = os.pathsep.join(str(v) for v in value)
        elif value is None:
            val = ""
        else:
            val = None

        # emit export command or warn
        if val is None:
            print_warn(f"Bad value given for environment variable {varname}: {value}")
        elif val:
            print(f'export {varname}="{val}"')


if __name__ == "__main__":
    main()
