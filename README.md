# dotfiles

[![Software License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/Muxelmann/dotfiles/blob/main/LICENSE)
[![Build, Test, & Lint](https://github.com/muxelmann/dotfiles/actions/workflows/blank.yml/badge.svg)](https://github.com/Muxelmann/dotfiles/blob/main/.github/workflows/blank.yml)

These are my custom dotfiles (copied form `~`) providing convenient macOS behavior. They are used on a daily basis and save some typing.

To install the dotfiles and all apps I freuqently use, simply run the following two lines:

```bash
chmod +x setup.sh
zsh setup.sh
```

The installwer will query whether to install "_non-essential_" apps from the AppStore and via Homebrew. If all or none of them should be installed, use the `-all` or `-skip` flag (CI tests with `-skip`).
