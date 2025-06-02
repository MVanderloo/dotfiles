if not set -q BREW_ENV_SOURCED
	set -x BREW_ENV_SOURCED 1
	/opt/homebrew/bin/brew shellenv | source
end
