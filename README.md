# Dotfiles

A collection of my personal configuration files managed using a bare git repo.

## Usage:

The `autoGit.sh` script automatically stages your configured dotfiles using the custom alias that can be found inside of `.bashrc`.

1. (Optional) Modify the CONFIG_TARGETS array in autoGit.sh to add/remove files
2. Run the script to stage files:
```bash
bash -i autoGit.sh
```
3. Commit your changes:
```bash
config commit -m <msg>
```
4. Push to git:
```bash
config push
```