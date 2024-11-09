# alias_git
Alias for Linux systems

To edit and create aliases, we will edit the bashrc file. 
```bash
nano ~/.bashrc
``

## Push.bash

1. Check if we are in a git repository
2. Git add -A
3. Git commit , with the commit ID as the message
6. Push

## Archi.bash

1. Check if we are in a git repo
2. Get the number of the last archi tag
3. Git add -A
4. Git commit "archi-" followed by the archi number
5. Git tag -ma "archi-" followed by the archi number
6. Push with the tag for the moulinette

## Save and reload

Quit vim by pressing "escape" then `:x` to save. 
Then reload the configuration with this command : 
```bash
source ~/.bashrc
```

It's ready!