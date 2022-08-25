# !/usr/bin/env bash

set -o errexit

echo "Installing Packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo 'Installing prerequisites for fuzzy searching...'
sudo dnf install the_silver_searcher ripgrep

echo 'Installing lazygit...'
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

echo 'Installing Hack Nerd Font (for nvim-tree icons)...'
bash install_nerd_fonts.sh

if [! go version]; then
	echo 'go is not installed'
	exit 1
fi

if [! node --version]; then
	echo 'node is not installed'
	exit 1
fi

echo 'Installing language servers...'
sudo npm i -g typescript typescript-language-server vscode-langservers-extracted bash-language-server
echo 'For lua, install the language server at https://github.com/sumneko/lua-language-server/releases'

go install golang.org/x/tools/gopls@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/go-delve/delve/cmd/dlv@latest

echo "If you want things to look even better, install Jetbrains Mono font: https://www.jetbrains.com/lp/mono/#how-to-install"
