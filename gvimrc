set guitablabel=%{GuiTabLabel()}  " Prefix tab labels with #s

set background=dark
colorscheme nova

set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=B
set guioptions+=c

if has("gui_gtk2")
    set guifont=Inconsolata\ Medium\ 12
elseif has("gui_win32")
    set guifont=Inconsolata\ Medium\ 12
elseif has("gui_macvim")
    set guifont=Inconsolata:h14
endif
