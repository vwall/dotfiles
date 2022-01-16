#!/usr/bin/env bork

# ok check "fdesetup status | grep 'On'"
# if check_failed; then
#   echo "FileVault is not set up. Please enable FileVault before continuing."
#   open "x-apple.systempreferences:com.apple.preference.security"
#   exit 1
# fi

ok directory "$HOME/.ssh"
ok check "[ -e $HOME/.ssh/*.pub ]"
if check_failed && satisfying; then
  echo "Please upload your new SSH key to GitHub before continuing"
  read -p "Press Return to continue" etc
fi

ok brew
ok brew git

ok directory "$HOME/code"
ok directory "$HOME/tmp"

ok brew fish
ok fisher
