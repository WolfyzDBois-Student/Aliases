# Aliases
> [!IMPORTANT]
> If you don't know what "moulinette" is then this repo won't be of much use to you.

## How to use aliases

An alias is a shortcut that allows you to make several specific requests in one, which makes your life easier.

To create your aliases:
1. Open your configuration file (typically `bashrc` or `zshrc`), with VIM for example:
```bash
nano ~/.bashrc
```
2. Copy and paste the contents of the .bash file at the end of your configuration file
3. Save the contents (`Escape` then the `:x` command on VIM)
4. Launch a new terminal. You may need to reload the configuration.
```bash
source ~/.bashrc
```

> [!WARNING]
> There may be issues depending on your operating system (e.g. between zsh and bashrc). Checks are made to see if there are differences, and in this case we will add files according to the versions.


## create

### Usage
```bash
$ create link-from-repo-to-clone
```

1. Clone your repositorie
2. Navigating to the corresponding folder
3. Create `README` file with content
4. Create `.gitignore` file with the provided .gitignore template
5. Git status

### Content of .gitignore
```bash
bin/
obj/
.idea/
*~
*.DotSettings.user
*.txt
*.json
```

> [!NOTE]
> Do not hesitate to check that the contents of the .gitignore have not changed. This gitignore is the one provided in the C# language TPs.

## push

1. Check if we are in a git repository
2. Git add -A
3. Git commit "push-" followed by the push number (0001 if first push, 0002 if second push, etc.)
4. Push

## archi

1. Check if we are in a git repository
2. Git add -A
3. Git commit "archi-" followed by the archi number (1 if first archi, 2 if second archi, etc.)
4. Git tag -ma "archi-" followed by the archi number
5. Push with the tag for the moulinette

## submit

1. Check if we are in a git repository
2. Check if the last commit is an "archi-" commit
3. Git add -A
4. Git commit "submit-" followed by the submit number (1 if first submit, 2 if second submit, etc.)
5. Git tag -ma "submit-" followed by the submit number
6. Push with the tag for the moulinette

> [!CAUTION]
> The code checks if an archi tag has been made before, however, ALWAYS check!!! that you have not made any changes since (even if the command is supposed to protect you from that) and ALWAYS check that your archi tag has passed


## Upcoming feature:
- Continue which does a git pull and opens rider (if is possible)
- Extraction & Execution of an .AppImage app

> [!TIP]
> Everything has been tested, however, unexpected behaviors in particular situations may have escaped us.
> If you find a bug or have ideas, open an Issue/PR
