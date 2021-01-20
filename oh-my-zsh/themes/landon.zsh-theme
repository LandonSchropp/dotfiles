# This theme is built on top of the Agnoster theme.
source "$ZSH/themes/agnoster.zsh-theme"

# Hide parts of the prompt.
prompt_status() {}
prompt_context() {}

# Customize the build prompt, substituting colors so they match my personal theme.
custom_build_prompt() {
  build_prompt | sed -E 's/{blue}/{magenta}/g' | sed -E 's/{yellow}/{cyan}/g'
}

# Override the $PROMPT variable so it uses the custom prompt function.
PROMPT='%{%f%b%k%}$(custom_build_prompt) '
