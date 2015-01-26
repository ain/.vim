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
| `,ci` | Toggle comment on line or block |
| __Git__ |
| `:Gbranch`  | Display Git branches with their tracked remotes, incl. current Git branch |
| `:Gst`      | Display Git status |
| `:Greset`   | Hard reset back to HEAD |
| `:Gurl`     | Display remote origin URL |
| `:Gpush`    | Push HEAD to origin |
| `:Gpull`    | Pull HEAD from origin with rebase |
| `:Gglog`    | Global log with stat |
| `:Gdlog`    | Global decorated log with stat highlighting branches |
| `:Gflog`    | Detailed log of file in buffer |
| `:Gclean`   | Remove newly created files |
| `:Gc`       | Alias of `:Gclean` |
| `:Gstash`   | Stash |
| `:Gfetch`   | Fetch |
| `:Gtrack <remote_name> <branch>`   | Set upstream |
| `:Gamend`   | Amend to last commit without edit (`git --amend --no-edit`) |
| `:Gtags`    | List all tags with description (`git tag -l -n1`) |
| `:Gcotag`   | Display tag that is currently checked out (`git name-rev --tags --name-only $(git rev-parse HEAD)`) |
| __Rails__ |
| `:Cap`    | Capistrano |
| `:Cstage` | Capistrano staging deploy |
| `:Clive`  | Capistrano production deploy |
| `:Rake <task>`  | Rake support by [vim-rake](https://github.com/tpope/vim-rake) |
| __Node.js__ |
| `:Npm <command>` | Shorthand for NPM, e.g. `:Npm i` |
| `:Nreset` | Node module dependency reset (`rm -rf node_modules; npm i`) |
| `:Ntest`  | Run Node tests |
| __Bower__ |
| `:Bower <command>` | Shorthand for Bower, e.g. `:Bower install` |
| `:Breset` | Bower dependency reset |
| __PHP__ |
| `:Composer <command>` | Shorthand for [Composer](https://getcomposer.org), e.g. `:Composer install` |
| __Utilities__ |
| `:Md5` | MD5 checksum of file in active buffer |
| `:Tstamp` | Insert UNIX timestamp |

## Tips
1. How to disable PressAndHold feature on Mac OS X Yosemite to restore key repeat: `defaults write com.apple.Terminal ApplePressAndHoldEnabled -bool false`

## Useful resources
- [vim tips and tricks](http://www.cs.swarthmore.edu/help/vim/home.html)