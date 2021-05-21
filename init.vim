set scrolloff=8
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent


call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'herrbischoff/cobalt2.vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'peitalin/vim-jsx-typescript'
Plug 'zivyangll/git-blame.vim'
call plug#end()


set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme cobalt2

let g:airline_powerline_fonts = 1
let g:airline_theme='cobalt2'
"let g:airline_statusline_ontop=1
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-emmet', 'coc-eslint', 'coc-prettier', 'coc-git' ]

let mapleader = " "

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :GFiles<Cr>
nnoremap <C-F> :Ag<Cr>

noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-q> :quitall!<CR>
nnoremap <tab>   :tabnext<CR>
noremap qq : :quit!<CR>

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <leader>ts <Plug>(coc-definition)
nmap <leader>ti <Plug>(coc-type-definition)
nmap <leader>tc <Plug>(coc-implementation)
nmap <leader>tr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" All Vim colors for files and other commands
autocmd VimEnter * NERDTree | wincmd p

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75
" orange
"
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
nnoremap <leader>g :<C-u>call gitblame#echo()<CR>
