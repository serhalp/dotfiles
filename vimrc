" Use vim settings rather than vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable pathogen.
execute pathogen#infect()

if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  set textwidth=100
  set autoindent
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When vimrc is edited, reload it
  autocmd! bufwritepost .vimrc source ~/.vimrc

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
endif " has("autocmd")

" Open a NERDtree when loading vim with no files.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Override color scheme backgroud colour.
" autocmd ColorScheme * highlight Normal guibg=#242424

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction

function! GuiTabLabel()
    " buffer_number[+] buffer_name [(number_windows)]

    " Add buffer number
    let label = v:lnum

    " Add '+' if one of the buffers in the tab page is modified
    let bufnrlist = tabpagebuflist(v:lnum)
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label .= '+'
            break
        endif
    endfor

    " Append the buffer name
    let label .= ' ' . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])

    " Append the number of windows in the tab page if more than one
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= ' (' . wincount . ')'
    endif

    return label
endfunction

" Custom mappings

" Clear MacVim's strange space mapping first.
nnoremap <Space> <Nop>
let mapleader = " "

" Toggle search highlighting
map <leader>h :set invhlsearch<CR>

" Tab to exit insert mode + tweaks
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^

" Quickly open .vimrc
map <leader>e :rightbelow split ~/.vimrc<CR>

" Miscellaneous
map Q gq

" Map enter to :make! ('!' makes it not jump to the first error/warning)
" FIXME: Find a way to only jump to errors and not warnings.
" map <C-M> :make!<CR>

" Ctrl-F12 to regenerate ctags database
" map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ .<CR>

" Use Ctrl-H to switch from .cpp to .h or vice versa
map <C-H> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" A few libreadline mappings
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" Duplicate window
noremap <leader>sl :rightbelow vsplit<CR>
noremap <leader>sh :leftabove vsplit<CR>
noremap <leader>sj :rightbelow split<CR>
noremap <leader>sJ :rightbelow split<CR>G
noremap <leader>sk :leftabove split<CR>
noremap <leader>sK :leftabove split<CR>gg
noremap <leader>st :tabnew<CR>

" New window with previous buffer
noremap <leader>spl :execute 'rightbelow vsplit' bufname('#')<CR>
noremap <leader>sph :execute 'leftabove vsplit' bufname('#')<CR>
noremap <leader>spj :execute 'rightbelow split' bufname('#')<CR>
noremap <leader>spk :execute 'leftabove split' bufname('#')<CR>
noremap <leader>spt :execute 'tabnew' bufname('#')<CR>

" Keys to move between windows
noremap gj <C-w>j
noremap g<down> <C-w>j
noremap gk <C-w>k
noremap g<up> <C-w>k
noremap gl <C-w>l
noremap g<left> <C-w>l
noremap gh <C-w>h
noremap g<right> <C-w>h
noremap g= <C-w>=

" Keys to close windows
noremap <leader>w :close<CR>
noremap <leader>W :only<CR>

" Toggle whether next/previous item mappings are for quickfix list or location list
command! ToggleListMappings call ToggleListMappings()
function! ToggleListMappings()
  if !exists('w:listMappingsMode')
    let w:listMappingsMode = 'location'
  endif

  if w:listMappingsMode == 'quickfix'
    let w:listMappingsMode = 'location'
    noremap <M-n> :lnext<CR>
    noremap <M-p> :lprevious<CR>
  elseif w:listMappingsMode == 'location'
    let w:listMappingsMode = 'quickfix'
    noremap <M-n> :cnext<CR>
    noremap <M-p> :cprevious<CR>
  endif
endfunction
call ToggleListMappings()

" Move a line of text around with Alt+j/Alt+k
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Global grep for word under cursor with Alt-* (Alt-Shift-*)
noremap <M-*> :Ag "<C-R><C-W>"<CR>

" Copy current filename to system clipboard
nnoremap <leader>f :let @* = expand("%")<CR>
" Copy `babel-node <current filename> --watch` to system clipboard
nnoremap <leader>tf :let @* = "babel-node " . expand("%") . " --watch"<CR>

" Custom options
"set mouse=a                       " Enable mouse in all modes
set backspace=indent,eol,start    " Allow backspacing over everything in insert mode
set history=500                   " Keep this many lines of command line history
set ruler                         " Show the cursor position all the time
set laststatus=2                  " Always show the status line
set statusline=%F%m%r%h\ \ [%{CurDir()}]\ %{fugitive#statusline()}\ %y\ \ [%{strftime(\"%c\",getftime(expand(\"%:p\")))}]\ \ [%l/%L:%c]
set number                        " Show line numbers
set showcmd                       " Display incomplete commands
set nohlsearch                    " Turn off search highlighting
set incsearch                     " Do incremental searching
set ignorecase                    " Ignore case when searching
set smartcase                     " Don't ignore case when pattern contains uppercase chars
set magic                         " Use regular expression magic mode (see help)
set noshowmatch                   " Turn off matching bracket highlighting
set scrolloff=5                   " Always show at least 5 lines past the cursor
set wildmenu                      " Use advanced ex mode completion
set undodir="~/.vim/runtime/undo" " Where to store persistent undo info
set undofile                      " Turn on persistent undo
set backupskip="/tmp/*"           " Don't create backup files for these.
set expandtab                     " Always use spaces; no tabs
set shiftwidth=2                  " Number of spaces in one level of indentation
set tabstop=8                     " Number of spaces to display where tabs are found
set linebreak                     " When wrapping lines, break them up in a sensible way
set nowrap                        " Turn off line wrapping
set foldmethod=indent             " Use indentation levels to figure out how to fold
set foldlevelstart=99             " Start with nothing folded
set vb                            " Turn on visual bell; turn off audi...al bell
set autowrite                     " Automagically save file before :make'ing
set tabpagemax=50                 " What purpose does this serve again?
set list listchars=               " Show whitespace characters explicitly.                         
set hidden                        " Allow edited buffers to exist behind the scenes.
set noequalalways                 " Disable automatic window resizing on close and split.
set keywordprg=npm\ docs          " Open docs for NPM module under cursor with `K`.

" Highlight current line and column
set cursorline
set cursorcolumn
highlight CursorLine guibg=#333333
highlight CursorColumn guibg=#333333

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git ls-files -co --exclude-standard %s']
let g:ctrlp_use_caching = 0

" Ag
let g:ag_highlight=1

" ultisnips
let g:UltiSnipsExpandTrigger="<M-o>"
let g:UltiSnipsJumpForwardTrigger="<M-o>"
let g:UltiSnipsJumpBackwardTrigger="<M-p>"

" goldenview
let g:goldenview__enable_at_startup=1
let g:goldenview__enable_default_mapping=0

" syntastic
let g:syntastic_auto_loc_list=1 " auto open error window when errors are detected
let g:syntastic_check_on_open=1 " check for errors on file open
let g:syntastic_error_symbol='x'
let g:syntastic_warning_symbol='?'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--rule=no-console:0,no-warning-comments:0'
" noremap <leader>l :SyntasticCheck<CR>:Errors<cr><C-w>j

" Extra Haskell options
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1

" Extra JavaScript (vim-javascript) options
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Extra JSX (vim-jsx) options
let g:jsx_ext_required = 0

" OS X specific options
set clipboard=unnamed
set macmeta
