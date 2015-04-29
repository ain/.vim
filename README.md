# My living Vim stack

Subject to constant change, the goal of this repository is to store a polyglot coding environment setup for Vim.

## Plugins

See [bundles](https://github.com/ain/.vim/tree/master/bundle).

## Dependencies

1. [ctags](http://ctags.sourceforge.net) for [tagbar](https://github.com/majutsushi/tagbar). Install with `sudo port install ctags` (MacPorts).
2. [powerline-fonts](https://github.com/powerline/fonts) for [vim-airline](https://github.com/bling/vim-airline) advanced status bar and tabline.

## Installation

1. Back up `~/.vim`
2. Remove `rm -rf ~/.vim`
3. Make sure you're in your home folder `cd ~`
4. Get the setup `git clone --recursive https://github.com/ain/.vim.git`
5. Symlink Vim configuration to home folder `ln -s ~/.vim/.vimrc .vimrc`

## Updates

1. Run `./update`

## Cheatsheet

| Vim command                      |  Description                                                                                        |
| -------------                    | -----------------                                                                                   |
| `gg=G`                           | Fix indentation                                                                                     |
| `dG`                             | Delete till EOF                                                                                     |
| `:w !pbcopy`                     | Copy entire buffer to pasteboard                                                                    |
| `"ay`                            | Copy to _a_ register                                                                                |
| `"ap`                            | Paste from _a_ register                                                                             |
| `F8`                             | Launch tagbar                                                                                       |
| __tabular__                      |
|  `:Tab /<regex>`                 | Tabularise data by regular expression                                                               |
| __vim-partial__                  |
| `,x`                             | Extract to partial                                                                                  |
| __Surroundings__                 |
| `ds"`                            | Remove double quotes on word under cursor                                                           |
| `cs"'`                           | Replace double quotes with single quotes on word under cursor                                       |
| `ysiw'`                          | Add single quotes on word under cursor                                                              |
| __NERDCommenter__                |
| `,cn`                            | Comment line or block                                                                               |
| `,ci`                            | Toggle comment on line or block                                                                     |
| __Git__                          |
| `:Ggrep <needle> -- <path>`      | Search for needle (optionally) at `<path>`                                                          |
| `:Gbranch`                       | Display Git branches                                                                                |
| `:Gbranches`                     | Display Git branches with their tracked remotes, incl. current Git branch                           |
| `:Gst`                           | Display Git status                                                                                  |
| `:Greset`                        | Hard reset back to HEAD                                                                             |
| `:Gurl`                          | Display remote origin URL                                                                           |
| `:Gpush`                         | Push HEAD to origin                                                                                 |
| `:Gpushf`                        | Force-push HEAD to origin                                                                           |
| `:Gpull`                         | Pull HEAD from origin with rebase                                                                   |
| `:Gglog`                         | Global log with stat                                                                                |
| `:Gdlog`                         | Global decorated log with stat highlighting branches                                                |
| `:Gflog`                         | Detailed log of file in buffer                                                                      |
| `:Gclean`                        | Remove newly created files                                                                          |
| `:Gc`                            | Alias of `:Gclean`                                                                                  |
| `:Gstash`                        | Stash                                                                                               |
| `:Gfetch`                        | Fetch                                                                                               |
| `:Gtrack <remote_name> <branch>` | Set upstream                                                                                        |
| `:Gamend`                        | Amend to last commit without edit (`git commit --amend --no-edit`)                                  |
| `:Grebuild`                      | Empty commit with message `Rebuild`, e.g. for GitHub Pages                                          |
| `:Gtags`                         | List all tags with description (`git tag -l -n1`)                                                   |
| `:Gcotag`                        | Display tag that is currently checked out (`git name-rev --tags --name-only $(git rev-parse HEAD)`) |
| `:Gcof <branch>`                 | Checkout file in buffer from another branch                                                         |
| `:Gmsg <message>`                | Change last commit message                                                                          |
| `:Gpr <ID>`                      | Fetch and checkout Pull Request by ID
| __Rails__                        |
| `:Rails`                         | Rails support by [vim-rails](https://github.com/tpope/vim-rails)                                    |
| `:Rvm`                           | Ruby Version Manager (RVM)                                                                          |
| `:Cap`                           | Capistrano support by [vim-capistrano](https://github.com/ain/vim-capistrano)                       |
| `:Cstage`                        | Capistrano staging deploy                                                                           |
| `:Clive`                         | Capistrano production deploy                                                                        |
| `:Rake`                          | Rake support by [vim-rake](https://github.com/tpope/vim-rake)                                       |
| __Node.js__                      |
| `:Npm <command>`                 | Shorthand for NPM, e.g. `:Npm i`                                                                    |
| `:Nreset`                        | Node module dependency reset (`rm -rf node_modules; npm i`)                                         |
| `:Ntest`                         | Run Node tests                                                                                      |
| __Bower__                        |
| `:Bower <command>`               | Shorthand for Bower, e.g. `:Bower install`                                                          |
| `:Breset`                        | Bower dependency reset                                                                              |
| __PHP__                          |
| `:Composer <command>`            | Shorthand for [Composer](https://getcomposer.org), e.g. `:Composer install`                         |
| __Utilities__                    |
| `:Md5`                           | MD5 checksum of file in active buffer                                                               |
| `:Tstamp`                        | Insert UNIX timestamp                                                                               |  

## Tips

1. How to disable PressAndHold feature on Mac OS X Yosemite to restore key repeat: `defaults write com.apple.Terminal ApplePressAndHoldEnabled -bool false`

## Useful resources

- [vim tips and tricks](http://www.cs.swarthmore.edu/help/vim/home.html)