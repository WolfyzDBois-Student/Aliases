# Alias
> [!IMPORTANT]
> If you don't know what "moulinette" is then this repo won't be of much use to you.

> [!TIP]
> Everything has been tested, however, unexpected behaviors in particular situations may have escaped us.
> If you find a bug or have ideas, open an Issue/PR


To edit and create aliases, we will edit the bashrc file. 
```bash
nano ~/.bashrc
```
You can do the same with zsh.

## push

1. Check if we are in a git repository
2. Git add -A
3. Git commit "push-" followed by the push number (1 if first push, 2 if second push, etc.)
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


## Save and reload

Quit vim by pressing "escape" then `:x` to save. 
Then reload the configuration with this command : 
```bash
source ~/.bashrc
```

It's ready to use! 

> [!TIP]
> Upcoming feature:
> - Start which creates a .gitignore file according to the classic architecture, and a classic README file (if is possible)
> - Continue which does a git pull and opens rider (if is possible)

