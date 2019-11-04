" Minimal Configuration
set nocompatible
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itspriddle/vim-shellcheck'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdtree'
Plug 'stephpy/vim-yaml'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'smeggingsmegger/vim-colorschemes'
Plug 'auxiliary/vim-layout'
call plug#end()

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1

"Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code.
"Defaults to 0 which is off.
let g:terraform_fold_sections=1

" Allow vim-terraform to automatically format *.tf and *.tfvars files
" with terraform fmt. You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1



let g:airline#extensions#tabline#enabled = 1

set enc=utf-8
set guifont=Powerline_Consolas:h11
set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
let g:airline_theme = 'codedark'

set t_Co=256
set t_ut=
colorscheme codedark
