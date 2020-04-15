set --global --export PATH \
  $HOME/bin \
  /usr/local/bin \
  /usr/{,s}bin \
  /{,s}bin

set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

for dircolors in {,g}dircolors
  type -fp $dircolors >/dev/null 2>&1; and source (eval "$dircolors --c-shell ~/.dircolorsrc|psub")
end

# Chruby
# source /usr/local/share/chruby/chruby.fish
# source /usr/local/share/chruby/auto.fish

#ASDF
# source ~/.asdf/asdf.fish

starship init fish | source

eval (direnv hook fish)
