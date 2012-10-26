" Vim syntax file
" Language: Todo
" Maintainer: Dani Donisa <dani.doni@gmail.com>
syntax clear

syn match todoTag         "@\h\w*"
syn match errorTag        "@errors"
syn match projectesTag    "@projectes"
syn match implementarTag  "@implementar"
syn match milloresTag     "@millores"
syn match todoDate        "../../.... "

hi def todoTag            ctermfg=Yellow      cterm=bold  
hi def errorTag           ctermfg=Red         cterm=bold
hi def projectesTag       ctermfg=Cyan        
hi def implementarTag     ctermfg=Yellow        
hi def milloresTag        ctermfg=Lightgreen  cterm=bold
hi def todoDate           ctermfg=Lightgreen
