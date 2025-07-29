# Philippe Serhal's dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- [Homebrew](https://brew.sh/)
- [GNU Stow](https://www.gnu.org/software/stow/)

### Homebrew Packages

```bash
brew install coreutils difftastic font-inconsolata-nerd-font gh git go htop hub neovim node python ripgrep ruby shellcheck stow the_silver_searcher tree-sitter wget
```

## Installation

From within the repository's directory, run the following command to create the symlinks:

```bash
stow *
```

To stow individual packages, run:

```bash
stow <package_name>
```

For example: `stow git`
