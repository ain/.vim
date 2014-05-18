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

## Cheatsheet
| Vim command | Description     |
|-------------|-----------------|
| `gg=G`        | Fix indentation |
| `dG`          | Delete till EOF |
| `:%w !pbcopy`  | Copy entire file to pasteboard |
| __Surroundings__ |
| `ds"`         | Remove double quotes on word under cursor |
| `cs"'`        | Replace double quotes with single quotes on word under cursor |
| `ysiw'`       | Add single quotes on word under cursor |
|__Git__ |
| `:Gbranch`  | Display current Git branch |
| `:Gst`      | Display Git status |
| `:Greset`   | Hard reset back to HEAD |
| `:Gurl`     | Display remote origin URL |
| `:Gpush`    | Push HEAD to origin |
| `:Gpull`    | Pull HEAD from origin |
| `:Gglog`    | Glogal log with stat |

## Useful resources
- [vim tips and tricks](http://www.cs.swarthmore.edu/help/vim/home.html) 
