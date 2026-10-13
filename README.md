# Philippe Serhal's dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- [Homebrew](https://brew.sh/)

### Homebrew Packages

```bash
brew install bash bash-completion@2 ca-certificates coderabbit coreutils diffnav difftastic ffmpeg \
  font-inconsolata-nerd-font gh git glib gnupg gnutls htop hub jq mise pinentry-mac ripgrep \
  shellcheck starship stow the_silver_searcher tree-sitter tree-sitter-cli wget yq zizmor zstd
```

### Change Default Shell to Bash

macOS ships an ancient Bash 3.2 (last GPLv2 release) as `/bin/bash`. Use Homebrew's modern Bash instead:

```bash
sudo sh -c 'echo /opt/homebrew/bin/bash >> /etc/shells'
chsh -s /opt/homebrew/bin/bash
```

Restart your terminal for the change to take effect.

## Installation

From within this repo's directory, run the following command to create the symlinks:

```bash
stow -d stow-packages -t ~ ag bash claude ghostty git gnupg iterm2 mise nvim ssh tmux workmux
```

Then, iTerm and iStat Menus require additional configuration:

```bash
for plist in *.plist
do
  defaults write $plist PrefsCustomFolder -string "$(pwd)"
  defaults write $plist LoadPrefsFromCustomFolder -bool true
done
```

**Note:** After installation, restart iTerm2 completely. If the Inconsolata Nerd Font doesn't appear correctly, go to iTerm2 → Settings → Profiles → Text and manually re-select "InconsolataNF-Regular" as the font to refresh the font cache.

To stow individual packages, run:

```bash
stow -d stow-packages -t ~ <package_name>
```

For example: `stow -d stow-packages -t ~ git`

## Tool Versions

I use `mise` to manage tool versions.

1.  **Trust the configuration:**

    ```bash
    mise trust ~/.config/mise/config.toml
    ```

2.  **Install the tools:**

    ```bash
    mise install
    ```

## Post-install

A few things aren't covered by stow, mise, or Homebrew:

1.  **Start the container runtime** used by the workmux sandbox. `colima`, `lima`, and `docker-cli` are installed by mise, but the VM isn't started automatically:

    ```bash
    colima start --vm-type vz --cpus 4 --memory 4
    ```

2.  **Install agent status tracking** for whichever agents you use:

    ```bash
    workmux setup
    ```

3.  **OpenCode + workmux:** released workmux doesn't support OpenCode v2 yet ([raine/workmux#290](https://github.com/raine/workmux/issues/290)) — the plugin `workmux setup` installs is a v1 plugin that fails to load. Until [PR #306](https://github.com/raine/workmux/pull/306) ships, install the v2 plugin manually: copy `index.ts`, `tui.ts`, and `status.ts` from the PR's `resources/opencode/v2/workmux-status/` into `~/.config/opencode/plugins/workmux-status/`, and delete any `~/.config/opencode/plugins/workmux-status.ts`. After #306 ships, `workmux setup` handles this automatically. Skip this step on machines that only run Claude Code.
