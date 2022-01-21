#!/usr/bin/env bork

ok check "fdesetup status | grep 'On'"
if check_failed; then
  echo "FileVault is not set up. Please enable FileVault before continuing."
  open "x-apple.systempreferences:com.apple.preference.security"
  exit 1
fi

ok directory "$HOME/.ssh"
ok check "[ -e $HOME/.ssh/*.pub ]"
if check_failed && satisfying; then
  echo "Generating SSH Key"
  ssh-keygen -t rsa -b 4096 -C "vrwaller@gmail.com"

  echo "Please upload your new SSH key to GitHub before continuing"
  read -p "Press Return to continue" etc
fi

ok brew
ok brew bork --HEAD
ok brew git

ok directory "$HOME/code"
ok directory "$HOME/src"

if [ -d "$HOME/dotfiles/configs" ]; then
  for config in $HOME/dotfiles/configs/*; do
    ok symlink "$HOME/.$(basename $config)" $config
  done
fi

ok brew fish

if did_install; then
  ok shells $(brew --prefix)/bin/fish
  chsh -s $(brew --prefix)/bin/fish
fi
