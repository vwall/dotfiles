alias c clear

# Real man's LS.
if ls --color=auto >/dev/null 2>&1
  alias ls 'command ls -Alh --color=auto'
else
  alias ls 'command ls -Alh -G'
end

alias l 'ls -lah'

alias s 'invoker start invoker.ini --certificate="/Users/vincentwaller/work/input/_wildcard.input.dev+4.pem" --private_key="/Users/vincentwaller/work/input/_wildcard.input.dev+4-key.pem"'

# Rails
alias rc 'rails console'
alias rdm 'rails db:migrate'
alias rt 'rails test'
alias rr 'rails routes'
alias bi 'bundle install'
alias bo 'bundle outdated'
alias bu 'bundle update'


# direnv
function da -d "Allow or disallow .envrc after printing it."
  echo "------------------------------------------------"
  cat .envrc
  echo "------------------------------------------------"
  echo "To allow, hit Return."
  read answer
  direnv allow
end

function tab
	set -l ascmd "osascript -e 'tell application \"Terminal\" to activate' -e 'tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down'"
	for arg in $argv
		set ascmd "$ascmd -e 'tell application \"Terminal\" to do script \"$arg\" in selected tab of the front window'"
	end
	set -l ascmd "$ascmd;"
	eval $ascmd
end

# Invoker
# alias s 'invoker start invoker.local.ini'

function s
  if count $argv > /dev/null
    eval "invoker start invoker.$argv.ini"
  else
    invoker start invoker.ini
  end
end
