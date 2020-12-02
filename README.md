# My living Vim stack

Subject to constant change, the goal of this repository is to store a polyglot coding environment setup for Vim.

## Plugins

See [/plugged](https://github.com/ain/.vim/tree/master/plugged).

## Dependencies

1. Vim with Python 3.3 support. Install with `sudo port install vim +python33` (MacPorts)
1. [ctags](http://ctags.sourceforge.net) for [tagbar](https://github.com/majutsushi/tagbar). Install with `sudo port install ctags` (MacPorts).
2. [powerline-fonts](https://github.com/powerline/fonts) for [vim-airline](https://github.com/bling/vim-airline) advanced status bar and tabline.
3. [JSCS](http://jscs.info). Install with `npm install -g jscs`.
4. [pwgen](http://linux.die.net/man/1/pwgen). Install with Homebrew or MacPorts.

## Installation

1. Clone

        $ git clone https://github.com/ain/.vim.git`

2. Symlink Vim configuration to home folder

        $ ln -s <clone path>/.vimrc ~/.vimrc

3. Install plugins by running `:PlugInstall` in Vim
4. Install [language servers](https://github.com/neoclide/coc.nvim/wiki/Language-servers#contents), e.g. `:CocInstall coc-json coc-tsserver` for JavaScript


## Updates

Run `PlugUpdate` in Vim.

## Cheatsheet

| Vim command                 |  Description                                                                                        |
| -------------               | -----------------                                                                                   |
| `gg=G`                      | Fix indentation                                                                                     |
| `dG`                        | Delete till EOF                                                                                     |
| `:w !pbcopy`                | Copy entire buffer to pasteboard                                                                    |
| `"ay`                       | Copy to _a_ register                                                                                |
| `"ap`                       | Paste from _a_ register                                                                             |
| `F8`                        | Launch tagbar                                                                                       |
| `za`                        | Fold block                                                                                          |
| `z<Shift>r`                 | Unfold all blocks                                                                                   |
| __tabular__                 |
|  `:Tabularize /<regex>`     | Tabularise data by regular expression                                                               |
| __Surroundings__            |
| `ds"`                       | Remove double quotes on word under cursor                                                           |
| `cs"'`                      | Replace double quotes with single quotes on word under cursor                                       |
| `ysiw'`                     | Add single quotes on word under cursor                                                              |
| __NERDCommenter__           |
| `,cn`                       | Comment line or block                                                                               |
| `,ci`                       | Toggle comment on line or block                                                                     |
| __Git__                     |
| `:Gbranches`                 | Display Git branches with their tracked remotes, incl. current Git branch                           |
| `:Grmbranches`               | Remove all local branches exc. master                                                               |
| `:Grmrbranches`              | Remove all remote branches exc. master                                                              |
| `:Gst`                       | Display Git status                                                                                  |
| `:Greset`                    | Hard reset back to HEAD                                                                             |
| `:Gurl`                      | Display remote origin URL                                                                           |
| `:Gpusho`                    | Push current branch to origin autosetting upstream                                                  |
| `:Gpushu`                    | Push current branch to origin autosetting upstream                                                  |
| `:Gpushf`                    | Force-push current branch to origin                                                                 |
| `:Gpushfu`                   | Force-push current branch to upstream                                                               |
| `:Gpullo`                    | Pull current branch from origin with rebase                                                         |
| `:Gpullu`                    | Pull current branch from upstream with rebase                                                       |
| `:Gglog`                     | Global log with stat                                                                                |
| `:Gdlog`                     | Global decorated log with stat highlighting branches                                                |
| `:Gflog`                     | Detailed log of file in buffer                                                                      |
| `:Gblog`                     | Current branch log                                                                                  |
| `:Gclean`                    | Remove newly created files                                                                          |
| `:Gamend`                    | Amend to last commit without edit (`git commit --amend --no-edit`)                                  |
| `:Grebuild`                  | Empty commit with message `Rebuild`, e.g. for CI systems                                            |
| `:Gtags`                     | List all tags with description (`git tag -l -n1`)                                                   |
| `:Gcotag`                    | Display tag that is currently checked out (`git name-rev --tags --name-only $(git rev-parse HEAD)`) |
| `:Gcof <branch>`             | Checkout file in buffer from another branch                                                         |
| `:Gmsg`                      | Change last commit message                                                                          |
| `:Gpr <remote> <ID>`         | Fetch and checkout Pull Request from remote by ID                                                   |
| `:Gbranchd <branch>`         | Delete branch locally and at origin                                                                 |
| __Utilities__                |
| `:Md5`                       | MD5 checksum of file in active buffer                                                               |
| `:Tstamp`                    | Insert UNIX timestamp at cursor                                                                     |  
| `:Pwd`                       | Insert 12-char alphanumeric password at cursor                                                      |  
| __coc.nvim__                 |
| `:CocInstall <extension>`    | Install coc extension for code completion
| __vim-plug__                 |
| `:PlugInstall`               | Install all plugins described in `.vimrc`                                                           |
| `:PlugUpdate`                | Update all plugins described in `.vimrc`. See [complete list of commands](https://github.com/junegunn/vim-plug/blob/master/README.md#commands) |

## Tips

1. Disabling PressAndHold feature on Mac OS X Yosemite (or greater) to restore key repeat: `defaults write com.apple.Terminal ApplePressAndHoldEnabled -bool false`

### GPG-signed commits on GitHub

1. Install [GPG Suite](https://gpgtools.org)
2. Create key in GPG Keychain
3. Export newly created key __without secret__
4. Copy key content to GitHub (_Settings_ > _SSH and GPG keys_ > _New GPG key_)
5. Configure signature locally, see [Telling Git about your GPG key](https://help.github.com/articles/telling-git-about-your-gpg-key/)
6. Let all commits be signed

        $ git config --global commit.gpgsign true

## Useful resources

- [vim tips and tricks](http://www.cs.swarthmore.edu/help/vim/home.html)
- [vim-fugitive doc](https://raw.githubusercontent.com/tpope/vim-fugitive/master/doc/fugitive.txt)
