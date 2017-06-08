set --global --export PATH \
  $HOME/bin \
  /usr/local/{,s}bin \
  /usr/{,s}bin \
  /{,s}bin


for dircolors in {,g}dircolors
  type -fp $dircolors >/dev/null 2>&1; and source (eval "$dircolors --c-shell ~/.dircolorsrc|psub")
end
