# My living Vim stack
Subject to constant change, the goal of this repository is to store a polyglot coding environment setup for Vim.

## Plugins
See [bundles](https://github.com/ain/.vim/tree/master/bundle).

## Installation
1. Back up `~/.vim`
2. Remove `rm -rf ~/.vim`
3. Make sure you're in your home folder `cd ~`
4. Get the setup `git clone --recursive https://github.com/ain/.vim.git`
5. Symlink Vim configuration to home folder `ln -s ~/.vim/.vimrc .vimrc`

## Updates
1. Run `./update`

## Cheatsheet
| Vim command | Description     |
|-------------|-----------------|
| `gg=G`        | Fix indentation |
| `dG`          | Delete till EOF |
| `:w !pbcopy`  | Copy entire buffer to pasteboard |
| __Surroundings__ |
| `ds"`         | Remove double quotes on word under cursor |
| `cs"'`        | Replace double quotes with single quotes on word under cursor |
| `ysiw'`       | Add single quotes on word under cursor |
| __NERDCommenter__ |
| `,cn` | Comment line or block |
| `,ci` | Uncomment line or block |
| __Git__ |
| `:Gbranch`  | Display Git branches with their tracked remotes, incl. current Git branch |
| `:Gst`      | Display Git status |
| `:Greset`   | Hard reset back to HEAD |
| `:Gurl`     | Display remote origin URL |
| `:Gpush`    | Push HEAD to origin |
| `:Gpull`    | Pull HEAD from origin with rebase |
| `:Gglog`    | Global log with stat |
| `:Gdlog`    | Global decorated log with stat highlighting branches |
| `:Gclean`   | Remove newly created files |
| `:Gstash`   | Stash |
| `:Gfetch`   | Fetch |
| `:Gtrack <remote_name> <branch>`   | Set upstream |
| `:Gamend`   | Amend to last commit without edit (`git --amend --no-edit`) |
| `:Gtags`    | List all tags with description (`git tag -l -n1`) |
| `:Gcotag`   | Display tag that is currently checked out (`git name-rev --tags --name-only $(git rev-parse HEAD)`) |
| __Rails__ |
| `:Cstage` | Capistrano staging deploy |
| `:Clive`  | Capistrano production deploy |
| __Node.js__ |
| `:Nreset` | Node module dependency reset (`rm -rf node_modules; npm i`) |
| __Bower__ |
| `:Bower <command>` | Shorthand for Bower, e.g. `:Bower install` |
| __Utilities__ |
| `:Tstamp` | Insert UNIX timestamp |

## Useful resources
- [vim tips and tricks](http://www.cs.swarthmore.edu/help/vim/home.html) 