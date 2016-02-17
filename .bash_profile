# Add ~/bin to path
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

# Load dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,bash_functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Boxen
[[ -f "/opt/boxen/env.sh" ]] && source "/opt/boxen/env.sh"

# Bash completion 
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# git completion
[[ -f "$HOME/.git-completion.bash" ]] && source $HOME/.git-completion.bash
# maven completion
[[ -f "$HOME/.maven-completion.bash" ]] && source $HOME/.maven-completion.bash

# init nodenv
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

