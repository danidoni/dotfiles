" Vim syntax file
" Language: Outliner
" Maintainer: Dani Donisa <dani.doni@gmail.com>

syntax clear

syn match projectTask1      "^\* [a-zA-Z].*"
syn match projectTask2      "^  \* [a-zA-Z].*"
syn match projectTask3      "^    \* [a-zA-Z].*"
syn match projectTask4      "^      \* [a-zA-Z].*"
syn match projectClock      "<\d\d-\d\d-\d\d\d\d>"
syn match projectProps      "^#.*"
syn match projectTable      "^|.*"

hi def projectTask1         ctermfg=Cyan
hi def projectTask2         ctermfg=Yellow
hi def projectTask3         ctermfg=Lightgreen
hi def projectTask4         ctermfg=Lightred
hi def projectClock         ctermfg=DarkGray cterm=bold
hi def projectProps         ctermfg=DarkGray cterm=bold
hi def projectTable         ctermfg=Cyan
