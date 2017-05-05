"Specify a directory for plugins"
call plug#begin('~/.local/share/nvim/plugged')
" Make sure you use single quotes"
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'critiqjo/lldb.nvim'
Plug 'mitsuhiko/vim-jinja'
call plug#end()

" Custom Key Mappings
map <Tab> :NERDTreeToggle<CR>

" Basic Settings
set number "Show the line number on the left side

" Python host
let g:python_host_prog = '/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python'

" Default Properties.
let NERDTreeShowHidden=1
