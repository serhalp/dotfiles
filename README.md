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
stow *
```

To stow individual packages, run:

```bash
stow <package_name>
```

For example: `stow git`

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
