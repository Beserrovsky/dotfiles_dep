# Dotfiles for Ubuntu 22.04 LTS

My preferred starting configuration. Currently using [Ubuntu 22.04 Jammy Jellyfish](https://releases.ubuntu.com/22.04/) + [Pop_OS! Shell](https://github.com/pop-os/shell) for tiling.

The installation script (`scripts/install.sh`) will install a suggested serving of programs and applications using scripts in the `scripts/programs/` directory. Please verify that you want these before running the script.

Add or delete programs in `scripts/install.sh` and `scripts/programs/` to modify your installation.

## Usage

After installing your fresh OS, [create any SSH keys](https://docs.github.com/articles/generating-an-ssh-key/) you need to access GitHub. See [copy-able commands](#set-up-ssh-keys) for doing this below.

If not generating new keys, place the ones you need in `.ssh/`. Remember to run `ssh-add` as well as `chmod 600 <key_name>`. Then clone this repository:

```sh
git clone git@github.com:beserrovsky/dotfiles.git
```

You may optionally like to pass the `--depth` argument to clone only a few of the [most recent commits](https://github.com/victoriadrake/dotfiles/commits/master).

Close Firefox if it's open, then run the installation script. (Read it first so you know what it does!)

```sh
cd dotfiles/scripts/
./install.sh
```

To install the Pop_OS! Shell for window tiling, see [Installation in their repo.](https://github.com/pop-os/shell#installation)

### Terminal theme

There are plenty of themes for Gnome terminal at [Mayccoll/Gogh](https://github.com/Mayccoll/Gogh).

Print a 256-color test pattern in your terminal:

```sh
for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
        printf "\n";
    fi
done
```

### Saving and loading configuration settings

Where `SETTINGS_BACKUP` is wherever you backed up/want to back up your settings (aptly named, isn't it?), load `settings.dconf` with:

```sh
dconf load /org/gnome/ < $(SETTINGS_BACKUP)/.config/dconf/settings.dconf
```

Back up new settings with:

```sh
dconf dump /org/gnome/ > $(SETTINGS_BACKUP)/.config/dconf/settings.dconf
```

Run `man dconf` on your machine for more.

### Set up SSH Keys

Commands for setting up a new SSH key.

1. Generate the key:

    ```sh
    ssh-keygen -t ed25519
    ```

2. Add it to the ssh-agent:

    ```sh
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```

3. Set appropriate permissions:

    ```sh
    chmod 600 ~/.ssh/id_ed25519
    ```

4. Show the public key so you can copy it to the service, e.g. GitHub:

    ```sh
    cat ~/.ssh/id_ed25519.pub
    ```

## Your personal CLI tool Makefile

See the Makefile in this repository for some helpful command aliases. Read about [self-documenting Makefiles on my blog](https://victoria.dev/blog/how-to-create-a-self-documenting-makefile/).
