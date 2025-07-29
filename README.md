# Philippe Serhal's dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- [Homebrew](https://brew.sh/)
- [GNU Stow](https://www.gnu.org/software/stow/)

### Homebrew Packages

```bash
brew install coreutils difftastic font-inconsolata-nerd-font gh git htop hub mise neovim ripgrep shellcheck stow the_silver_searcher tree-sitter wget
```

## Installation

From within this repo's directory, run the following command to create the symlinks:

```bash
stow -d stow-packages -t ~ ag bash git iterm2 mise nvim ssh
cp com.googlecode.iterm2.plist ~/Library/Preferences/
```

To stow individual packages, run:

```bash
stow -d -t ~ stow-packages <package_name>
```

For example: `stow -d -t ~ stow-packages git`

## Tool Versions

I use `mise` to manage tool versions.

1.  **Trust the configuration:**

    ```bash
    mise trust
    ```

2.  **Install the tools:**

    ```bash
    mise install
    ```
