" Status line colors, Gray on DarkBlue, borrowed from Twilight theme
hi StatusLine   guibg=#AAAAAA   guifg=#647C95   ctermfg=White   ctermbg=DarkGray    term=none   cterm=none     gui=underline		    
hi StatusLineNC	guibg=#AAAAAA   guifg=#526A83   ctermfg=Gray    ctermbg=Black    term=none   cterm=none     gui=none
" The Completion dialog, Gray on DarkBlue, adapted from Twilight theme
hi PmenuSel     guibg=#25345F   guifg=#DDDDDD   ctermfg=White   ctermbg=DarkBlue    term=none   cterm=none     gui=underline		    
hi Pmenu	    guibg=#25345F   guifg=#526A83   ctermfg=Gray    ctermbg=DarkBlue    term=none   cterm=none     gui=none

" Set statusline
set statusline=%t       "tail of the filename
set statusline+=\ \|\ %{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=\ \|\ %{&ff} "file format
set statusline+=\ \|\ %h     "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=git\:%{GitBranch()}\  " Current dir git branch
set statusline+=\ \|\ %c,     "cursor column
set statusline+=%l/%L  "cursor line/total lines
set statusline+=\ \|\ %P     "percent through file
set laststatus=2        " Always show the statusline

