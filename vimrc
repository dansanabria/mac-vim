call pathogen#infect()
call pathogen#helptags()
colorscheme base16-tomorrow
" set background=dark
" you are using a 256 terminal theme you need to set this
let base16colorspace=256
syntax on
filetype plugin indent on

" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline
set bg=dark

" set default comment color to cyan instead of darkblue
" which is not very legible on a black background
" highlight comment ctermfg=cyan

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\	/
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Show me a ruler
set ruler

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" Enable indentation matching for =>'s
filetype plugin indent on

" Turn on line numbering:
set number

" Mapping leader+n to toggle NERDTreeTabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" keybinding for tabs
map <F7> <Esc>:tabp<CR>
map <F8> <Esc>:tabn<CR>

" Open a new tab and search for something
nmap <leader>a :tab split<CR>:Ack ""<Left>

" Inmediatly search for the word under the cursor in a new tab
nmap <leader>a :tab split<CR>Ack <C-r><C-w><CR>
