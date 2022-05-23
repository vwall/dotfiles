# Fish config
set -gx BORK_COLOR true

set PATH /opt/homebrew/bin $PATH
set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

source (brew --prefix asdf)/asdf.fish
direnv hook fish | source
