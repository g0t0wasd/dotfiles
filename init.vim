syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab " convert tabs to spaces
set smartindent
set nu relativenumber
set clipboard=unnamedplus " copy paste between VIM and other windows
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set cursorline
set noshowmode    " hide default mode indicator (--INSERT--, --VISUAL--)
set guioptions-=m " hide menu
set guioptions-=T " hide toolbar
set guioptions-=r " hide right scrollbar
set guioptions-=l " hide left scrollbar
set guioptions-=L " hide scrollbar
set guioptions-=R " hide scrollbar
set guioptions-=e " hide gui tabs
set updatetime=300 "
set nohlsearch    " turn off search highlighting
" set termguicolors " for highlighting

set colorcolumn=80
highlight Colorcolumn ctermbg=0 guibg=grey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'nvie/vim-flake8'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua' " highlighting the colors

call plug#end()

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='soft'

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dif=%s/.git ls-files -oc --exclude-standard']

let mapleader = " "

let g:netrw_altv = 1 " open file in vert split
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 30
" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Lexplore
" augroup END

" ag is fast enoug that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" Coc.nvim
let g:coc_global_extensions = ['coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver','coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-stylelint']
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Run python script
nmap <leader>r :!python3 %<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :Lexplore<CR>
nnoremap <leader>ps :RgFind '' -g '*.*'<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <leader>pf :Files<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" yank till the end of line
nnoremap Y y$

" highlight last inserted text
nnoremap gV `[v`]

" Comment / uncomment
augroup commenting
        autocmd FileType javascript let b:comment_leader = '// '
        autocmd FileType c,cpp      let b:comment_leader = '// '
        autocmd FileType sh,python  let b:comment_leader = '# '
        autocmd FileType vim        let b:comment_leader = '" '
        noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
        noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:nohlsearch<CR>
augroup END

" Git usage
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gb :Gblame<CR>

" --- Splits ---
set splitbelow splitright

" Change 2 split windows from vert to horiz or vice versa
" map <Leader>th <C-W>t<C-W>H
" map <Leader>tk <C-W>t<C-W>K

" Split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Friendly split resizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" New tab
nnoremap <leader>t :tabnew<CR>

" Tabs navigation
noremap <leader>1 1gt<CR>
noremap <leader>2 2gt<CR>
noremap <leader>3 3gt<CR>
noremap <leader>4 4gt<CR>
noremap <leader>5 5gt<CR>
noremap <leader>6 6gt<CR>
noremap <leader>7 7gt<CR>
noremap <leader>8 8gt<CR>
noremap <leader>9 9gt<CR>

" Save
noremap <leader>w :w<CR>
" show last changes
noremap <leader>d :w !diff % -<CR>
noremap <leader>i :w !isort %<CR>
" quit current window
nmap <leader>q :q<CR>
nmap <leader>Q :qa!<CR>

" Substitute the word under the cursor.
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

"Tagbar
nmap <F8> :TagbarToggle<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* RgFind
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

let g:vimspector_enable_mappings = 'HUMAN'
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" Flake 8 autocheck
autocmd BufWritePost *.py call flake8#Flake8()

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=cro

" Statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  if strlen(l:branchname) > 15
      let l:branchname = l:branchname[:15] . "..."
  endif
  let b:gitstatus = strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

autocmd VimEnter,BufEnter,FileType * call StatuslineGit() "sets branch name on vim start, new buffer open and for quickfix window


hi NormalColor guifg=Black guibg=Green ctermbg=34 ctermfg=0
hi InsertColor guifg=Black guibg=Cyan ctermbg=44 ctermfg=0
hi ReplaceColor guifg=Black guibg=maroon1 ctermbg=165 ctermfg=0
hi VisualColor guifg=Black guibg=Orange ctermbg=202 ctermfg=0
hi CommandColor guifg=White guibg=Black ctermbg=12 ctermfg=11
hi DelimiterColor ctermbg=7 ctermfg=0


set laststatus=2
set statusline=
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()==?'i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()==?'R')?'\ \ RPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()==#'v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(mode()==#'V')?'\ \ V-LINE\ ':''}
set statusline+=%#VisualColor#%{(mode()==nr2char(22))?'\ \ V-BLOCK\ ':''}
set statusline+=%#CommandColor#%{(mode()=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#CursorIM#
set statusline+=%(%{b:gitstatus}%) " git branch
set statusline+=%#DelimiterColor#
set statusline+=\ \%f "full path
set statusline+=\%m " modified [+] flag
set statusline+=%= " right align
set statusline+=\ %y\                                 " FileType
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}] " Encoding & Fileformat
set statusline+=\ %l:\%c\ %L\            " Rownumber: colnumber total rows
