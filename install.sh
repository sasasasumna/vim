#!/usr/bin/env bash
# This file lives in ~/.vim/install.sh
# Remember to add executable: chmod +x ~/.vim/install.sh

vim_config_dir="$(git rev-parse --show-toplevel)"
ln -sf $vim_config_dir/vimrc $HOME/.vimrc
mkdir -p $vim_config_dir/swp

#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$(git rev-parse --show-toplevel)/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}
# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
#    cd "$expected_repo" || exit
#    result=$(git pull --force)
    echo "$expected_repo: Already installed, skipping"
#    cd - > /dev/null
  else
    echo "$expected_repo: Installing..."
    submodule_path="$(pwd | sed s!^$vim_config_dir/!!g)/$expected_repo"
    git submodule add $repo_url $submodule_name
  fi
}
echo "Updating installed plugins via 'git submodule update --remote --merge'..."
git submodule update --remote --merge

set_group ruby
package https://github.com/tpope/vim-rails.git
package https://github.com/tpope/vim-rake.git
package https://github.com/tpope/vim-bundler.git
package https://github.com/tpope/vim-rbenv.git
package https://github.com/slim-template/vim-slim
package https://github.com/tpope/vim-endwise.git
package https://github.com/fishbullet/deoplete-ruby

set_group javascript
package https://github.com/mxw/vim-jsx
package https://github.com/pangloss/vim-javascript
package https://github.com/carlitux/deoplete-ternjs

set_group syntax
package https://github.com/kchmck/vim-coffee-script.git
package https://github.com/tpope/vim-markdown.git
package https://github.com/ap/vim-css-color.git

set_group golang
package https://github.com/fatih/vim-go
package https://github.com/zchee/deoplete-go
package https://github.com/Blackrush/vim-gocode

set_group ide
package https://github.com/tpope/vim-projectionist
package https://github.com/ludovicchabant/vim-gutentags
package https://github.com/xolox/vim-misc
package https://github.com/w0rp/ale
package https://github.com/airblade/vim-gitgutter
package https://github.com/tpope/vim-sensible
package https://github.com/ryanoasis/vim-devicons
package https://github.com/vim-airline/vim-airline
package https://github.com/vim-airline/vim-airline-themes
package https://github.com/ctrlpvim/ctrlp.vim
package https://github.com/mileszs/ack.vim
package https://github.com/fweep/vim-zsh-path-completion
package https://github.com/roxma/vim-hug-neovim-rpc
package https://github.com/roxma/nvim-yarp
package https://github.com/Shougo/deoplete.nvim
package https://github.com/neomake/neomake

set_group zsh
package https://github.com/zchee/deoplete-zsh

set_group colorschemes
package https://github.com/nanotech/jellybeans.vim
