unmap <Space>
" let mapleader = "<Space>"
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
nunmap S
vunmap S
map [[ :surround_wiki
map S" :surround_double_quotes
map S' :surround_single_quotes
map Sb :surround_brackets
map S( :surround_brackets
map S) :surround_brackets
map S[ :surround_square_brackets
map S[ :surround_square_brackets
map S{ :surround_curly_brackets
map S} :surround_curly_brackets

" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold
vmap zo :togglefold
vmap zc :togglefold
vmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

" Emulate Tab Switching https://vimhelp.org/tabpage.txt.html#gt
" requires Cycle Through Panes Plugins https://obsidian.md/plugins?id=cycle-through-panes
exmap tabnext obcommand cycle-through-panes:cycle-through-panes
nmap gt :tabnext
exmap tabprev obcommand cycle-through-panes:cycle-through-panes-reverse
nmap gT :tabprev

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
vmap j gj
vmap k gk
" I like using H and L for beginning/end of line
nmap H 0
nmap L $
vmap H 0
vmap L $
" Quickly remove search highlights
nmap -k :nohl
vmap -k :nohl

" Yank to system clipboard
" set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
vmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward
vmap <C-i> :forward

set tabstop=4

" obcommand editor:insert-link
" obcommand editor:toggle-comment
" obcommand app:go-back
" obcommand workspace:split-vertical

map <A-p> :pasteinto

imap kj <Esc>

nmap ; :
vmap ; :
exmap focusRight obcommand editor:focus-right
exmap focusLeft obcommand editor:focus-left
exmap focusTop obcommand editor:focus-top
exmap focusBottom obcommand editor:focus-bottom
nmap <Up> :focusTop
nmap <Down> :focusBottom
nmap <Left> :focusLeft
nmap <Right> :focusRight

set clipboard=unnamedplus
exmap togglefocus obcommand obsidian-focus-mode:toggle-focus-mode
nmap <Space>k :togglefocus
exmap splitright obcommand workspace:split-vertical
nmap <Space>vs :splitright
exmap toggleleftsidebar obcommand app:toggle-left-sidebar
nmap <Space>n :toggleleftsidebar
