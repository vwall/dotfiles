alias c clear

# Real man's LS.
if ls --color=auto >/dev/null 2>&1
  alias ls 'command ls -Alh --color=auto'
else
  alias ls 'command ls -Alh -G'
end

alias l 'ls -lah'

function da -d "Allow or disallow .envrc after printing it."
  echo "------------------------------------------------"
  cat .envrc
  echo "------------------------------------------------"
  echo "To allow, hit Return."
  read answer
  direnv allow
end
