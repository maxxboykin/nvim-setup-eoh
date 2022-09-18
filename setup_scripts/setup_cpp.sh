#!/usr/bin/env bash

echo "Do you want to set up C++? (y for yes)"
read setup_cpp

if [[ $setup_cpp -ne 'y' ]]; then
	echo "Not setting up C++ for Neovim"
	exit 0
fi

echo "Installing C/C++ compilers and CMake..."
sudo dnf install clang clang-devel cmake lldb