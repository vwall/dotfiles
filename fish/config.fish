set --global --export PATH \
  $HOME/bin \
  /usr/local/bin \
  /usr/{,s}bin \
  /{,s}bin

set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

for dircolors in {,g}dircolors
  type -fp $dircolors >/dev/null 2>&1; and source (eval "$dircolors --c-shell ~/.dircolorsrc|psub")
end

#ASDF
source (brew --prefix asdf)/asdf.fish

starship init fish | source

eval (direnv hook fish)
