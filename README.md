# alias_git
Alias for Linux systems

To edit and create aliases, we will edit the bashrc file. 
```bash
nano ~/.bashrc
```

## push

1. Check if we are in a git repository
2. Git add -A
3. Git commit , with the commit ID as the message
6. Push

## archi

1. Check if we are in a git repo
2. Get the number of the last archi tag
3. Git add -A
4. Git commit "archi-" followed by the archi number
5. Git tag -ma "archi-" followed by the archi number
6. Push with the tag for the moulinette

## submit

1. Check if we are in a git repo
2. Check if an archi tag has been made, and complain if it hasn't.
3. Get the number of the last archi tag
4. Git add -A
5. Git commit "submit-" followed by the archi number
6. Git tag -ma "submit-" followed by the archi number
7. Push with the tag for the moulinette

## Save and reload

Quit vim by pressing "escape" then `:x` to save. 
Then reload the configuration with this command : 
```bash
source ~/.bashrc
```

It's ready!