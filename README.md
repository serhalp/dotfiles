# Philippe Serhal's dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- [Homebrew](https://brew.sh/)
- [GNU Stow](https://www.gnu.org/software/stow/)

### Homebrew Packages

```bash
brew install bash-completion coreutils difftastic font-inconsolata-nerd-font gh git gnupg htop hub mise neovim ripgrep shellcheck starship stow the_silver_searcher tree-sitter wget
```

### Change Default Shell to Bash

```bash
chsh -s /bin/bash
```

Restart your terminal for the change to take effect.

## Installation

From within this repo's directory, run the following command to create the symlinks:

```bash
stow -d stow-packages -t ~ ag bash git iterm2 mise nvim ssh
ln -s $PWD/com.googlecode.iterm2.plist ~/Library/Preferences/
```

**Note:** After installation, restart iTerm2 completely. If the Inconsolata Nerd Font doesn't appear correctly, go to iTerm2 → Settings → Profiles → Text and manually re-select "InconsolataNF-Regular" as the font to refresh the font cache.

To stow individual packages, run:

```bash
stow -d -t ~ stow-packages <package_name>
```

For example: `stow -d -t ~ stow-packages git`

## Tool Versions

I use `mise` to manage tool versions.

1.  **Trust the configuration:**

    ```bash
    mise trust ~/.mise.toml
    ```

2.  **Install the tools:**

    ```bash
    mise install
    ```
