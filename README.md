# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)

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
