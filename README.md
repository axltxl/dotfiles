# dotfiles

Personal configuration files for zsh, tmux, git, and development tools.

## Installation

```bash
git clone git@github.com:ricoveri/dotfiles.git /tmp/dotfiles
cd /tmp/dotfiles && cp -r . ~
```

## Requirements

- [zsh](https://www.zsh.org/) + [oh-my-zsh](https://ohmyz.sh/#install)
- [tmux](https://github.com/tmux/tmux) (v3.3a+) + [tpm](https://github.com/tmux-plugins/tpm)
- [fzf](https://github.com/junegunn/fzf)
- [Rust/Cargo](https://rustup.rs/) (optional, for [envy](https://github.com/ricoveri/envy))

## What's Included

- **Zsh**: Custom plugins, theme configuration, and modular profile scripts
- **Tmux**: Sensible defaults, key bindings, and plugin management
- **Git**: Global configuration
- **Tools**: Auto-setup for Neovim, Golang, Rust, Homebrew, and more via profile scripts

## Copyright and Licensing

Copyright (c) 2025 Alejandro Ricoveri

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
