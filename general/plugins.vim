call plug#begin('~/.config/nvim/plugged')

	" Code completion
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe'
	
	" Navigation and searching
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	
	Plug 'junegunn/fzf.vim'
	Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'

	" Git
	Plug 'airblade/vim-gitgutter'
	Plug 'APZelos/blamer.nvim'
	
	" Colors and themes
	" Plug 'sonph/onehalf', { 'rtp': 'vim' }
	" Plug 'vim-airline/vim-airline'

	" Misc

call plug#end()


