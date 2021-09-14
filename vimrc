let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'LnL7/vim-nix'
Plug 'jparise/vim-graphql'
Plug 'hashivim/vim-terraform'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'romainl/vim-qf'
Plug 'preservim/tagbar'

Plug 'szymonmaszke/vimpyter'
Plug 'deoplete-plugins/deoplete-jedi'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/Zenburn'

call plug#end()

let mapleader=","
set clipboard+=unnamed
set nowrap
set relativenumber

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-l>"

colorscheme zenburn

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nmap <silent> <DOWN> :cnext<CR>
nmap <silent> <UP> :cprev<CR>

nmap <silent> <c-j> <c-w>j
nmap <silent> <c-k> <c-w>k
nmap <silent> <c-h> <c-w>h
nmap <silent> <c-l> <c-w>l

map <leader>y "*y

let g:deoplete#enable_at_startup = 1
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
set backspace=indent,eol,start
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

filetype plugin on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
" set smartindent
set laststatus=2
set showmatch
set incsearch

au FileType go nmap <S-F5> :GoDebugStop<CR>
au FileType go nmap <F5> :GoDebugContinue<CR>
au FileType go nmap <F9> :GoDebugBreakpoint<CR>
au FileType go nmap <F10> :GoDebugNext<CR>
au FileType go nmap <F11> :GoDebugStep<CR>
au FileType go nmap <S-F11> :GoDebugStepOut<CR>

" augroup auto_go
"     autocmd!

"     nmap <S-F5> :GoDebugStop<CR>
"     nmap <F5> :GoDebugContinue<CR>
"     nmap <F9> :GoDebugBreakpoint<CR>
"     nmap <F10> :GoDebugNext<CR>
"     nmap <F11> :GoDebugStep<CR>
"     nmap <S-F11> :GoDebugStepOut<CR>

    " autocmd BufWritePost *.go :GoTest
    " autocmd BufWritePost *_test.go :GoTest
" augroup end
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'ineffassign', 'staticcheck', 'structcheck', 'typecheck', 'unused', 'varcheck', 'gofmt']
let g:go_metalinter_command = "golangci-lint"
let g:go_list_type = 'quickfix'
let g:go_addtags_transform = "camelcase"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:terraform_fmt_on_save=1
let g:terraform_align=1

autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>
