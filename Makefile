install-homebrew:
	brew bundle --file Brewfile

install-zshrc:
	rm -f ~/.zshrc ~/.zsh_common.zsh ~/.zsh_local.zsh
	ln -s `pwd`/zsh/zsh_common.zsh ~/.zsh_common.zsh
	ln -s `pwd`/zsh/zsh_local.zsh ~/.zsh_local.zsh
	ln -s `pwd`/zsh/zsh ~/.zshrc
        
install-neovim:
	rm -f ~/.config/nvim/init.lua
	rm -f ~/.config/nvim/lua/config/lazy.lua
	rm -f ~/.config/nvim/lua/options.lua
	mkdir -p ~/.config/nvim/lua/config/
	mkdir -p ~/.config/nvim/lua/plugins/
	ln -s `pwd`/nvim/init.lua ~/.config/nvim/init.lua
	ln -s `pwd`/nvim/lua/config/lazy.lua ~/.config/nvim/lua/config/lazy.lua
	ln -s `pwd`/nvim/lua/options.lua ~/.config/nvim/lua/options.lua
        
