execute pathogen#infect()
syntax on

" setting up colorscheme
set termguicolors
colorscheme gruvbox

" setting dark background on Linux
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux"
  set background=dark
endif

" mapping double s to esc
inoremap § <esc>

" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline

" set default comment color to cyan instead of darkblue
" which is not very legible on a black background
" highlight comment ctermfg=cyan

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set backspace=2

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
map <Leader>N <plug>NERDTreeTabsToggle<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" keybinding for tabs
map <F7> <Esc>:tabp<CR>
map <F8> <Esc>:tabn<CR>

" Open a new tab and search for something
nmap <leader>a :tab split<CR>:Ack ""<Left>

" Inmediatly search for the word under the cursor in a new tab
nmap <leader>A :tab split<CR>Ack <C-r><C-w><CR>

" enabling lightline
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }
" Disabling powrline separators for tmuxline
let g:tmuxline_powerline_separators = 0

" use ack.vim to drive ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['pyyaml']
let g:syntastic_make_checkers = ['gnumake']

" Disable AutoComplPop.
let g:acp_enableAtStartup = -1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

""""""""""""""""""""""""""""""""""""""
" adding merlin support
""""""""""""""""""""""""""""""""""""""
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:merlin_completion_with_doc = 1

let g:syntastic_ocaml_checkers = ['merlin']

" close preview once completion is done
au! CompleteDone * :pclose

" vim-slime settings
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

" Enabling terraform specific indentation
let g:terraform_align=1

" syntastic settings for terraform
let g:syntastic_terraform_tffilter_plan = 0

" tagging for ruby
set tags+=./tags
map <C-F12> :!ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=node_modules .<CR>
au BufRead,BufNewFile *.rb setlocal tags+=~/.vim/tags/ruby_2.4.0,~/.vim/tags/gems_inspec-azure

" using v to esc in visual mode
cno jj <c-c>
vno v <esc>

""""""""""""""""""""""""""""""""""""""
" javacomplete settings
""""""""""""""""""""""""""""""""""""""
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"To enable smart (trying to guess import option) inserting class imports with F4, add:
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

" To enable usual (will ask for import option) inserting class imports with F5, add:
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

" To add all missing imports with F6:
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" To remove all unused imports with F7:
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Set Vagrantfile file type to ruby
au BufRead Vagrantfile setf ruby
