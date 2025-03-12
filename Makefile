install-homebrew:
	brew bundle --file Brewfile

install-zshrc:
	rm -f ~/.zshrc ~/.zsh_common.zsh ~/.zsh_local.zsh
	ln -s `pwd`/zsh/zsh_common.zsh ~/.zsh_common.zsh
	ln -s `pwd`/zsh/zsh_local.zsh ~/.zsh_local.zsh
	ln -s `pwd`/zsh/zsh ~/.zshrc
