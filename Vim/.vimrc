" == Basic config =============================================================
set nocompatible
filetype plugin indent on
" filetype off " Pathogen compat
" Enable incremental search
set incsearch
" Window title gets current buffer name
set title
" Map leader key
let mapleader=","
" For better highlighting in dark background consoles
set background=dark
" Put swapfiles on ~/.tmp
set dir=~/.tmp
" Enable syntax highlighting
syntax on
" Turn tabs to spaces and set tab length to 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set softtabstop=2
set smartindent
set smarttab
" Gui options
set guioptions=em
set showtabline=1
" No backup
set nobackup
set number
set nuw=6
" Set tags file
set tags=.tags

" File type detection
augroup filetypedetect
    au BufNewFile,BufRead *.xt  set filetype=xt
    au BufNewFile,BufRead *.org set filetype=org
    au BufNewFile,BufRead *.viki set filetype=viki
    au BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^
augroup END

" == Plugins ==================================================================
" All plugins go into ~/.vim/bundles/<plugin_name>
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" == Functions ================================================================

" Hilights word under cursor
" DISABLED au CursorHold * call HighlightWordUnderCursor()
function! HighlightWordUnderCursor()
    try
        execute 'silent! match IncSearch /\<'.escape(expand("<cword>"), "\\").'\>/'
    catch
        return
    endtry
endfunction
" DISABLED set updatetime=2000 " CursorHold timeout is 2s
nmap <C-h> :call HighlightWordUnderCursor()<CR>

" Search and replace words under cursor with "\s"
nnoremap <Leader>fr :%s/\<<C-r><C-w>\>/
" Find in files the word under cursor
nnoremap <Leader>ff :Ack <C-r><C-w>

" Jump to tag in new tab
nnoremap <Leader>g call OpenTagInNewTab()
function! OpenTagInNewTab()
    let a:word = expand("<cword>")
    execute "tabnew<CR>"
    execute ("tag " . a:word)<CR>
endfunction

function! ToggleNERDTree()
    if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
        :set columns=121
        :NERDTreeClose
    else
        :set columns=" 150
        :NERDTree
    endif
endfunction
" nmap <C-e> :call ToggleNERDTree()<CR>

" 256 colors only if you can handle it
if $TERM =~ "-256color"
  set t_Co=256
  colorscheme railscasts
endif
" colorscheme Tomorrow-Night

if has('gui_running')
	set guifont=Terminus\ 10

	set lines=45
	set columns=100
endif

" Map F4 to rebuild tags file
nmap <silent> <Leader>rf
    \ :!ctags-exuberant -f .tags
    \ --langmap="php:+.inc"
    \ -h ".php.inc" -R --totals=yes
    \ --tag-relative=yes --PHP-kinds=+cf-v .<CR>

" Fuzzy Finder Textmate Config
let g:fuzzy_enumerating_limit=40
let g:fuzzy_ceiling=20000

" Otl config
let g:otl_bold_headers = 0

" VSTreeExplorer, vertical layout
let g:treeExplVertical = 1
let g:treeExplWinSize = 40

" Viki config
let g:vikiFancyHeadings = 1

" Wiki config
let g:vimwiki_list = [{'path': '~/Dropbox/Notes/', 'index': 'index'}]
let g:vimwiki_browsers = ['/usr/bin/chromium-browser']

" Paste toggle
set pastetoggle=<F12>

" Tab navigation
map <C-t> :tabnew<CR>
map <silent> J :tabprevious<CR>
map <silent> K :tabnext<CR>
map <silent> <C-o> :FuzzyFinderTextMate<CR>
map <silent> <Leader>t :FuzzyFinderTag<CR>
map <C-f> :Ack 
let g:ackprg="ack -a -H --nocolor --nogroup --column"

" Execute current file
map <C-x><C-x> :!%<CR>

" Use tab to jump between parens (% is painful)
nnoremap <TAB> %

" Fugitive mappings
" nmap <leader>gs :Gstatus<CR>
" nmap <leader>gc :Gcommit<CR>
" Go mappings
nmap <F5> :make<CR>

function! GitBranch()
  let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
  if branch != ''
    return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
  en
  return ''
endfunction

command -nargs=+ Dmanage !python manage.py <q-args>

" Collapse 100% lines in vimoutliner
function! Close100() 
  let l:line1 = line(".") 
  normal 1G 
  while search( "100%", "W" ) > 0 
    foldopen 
    foldclose 
  endwhile 
  execute ":normal " . l:line1 . "G" 
endfunction 
au BufRead,BufNewFile *.otl map zz :call Close100()<CR> 

let g:fuzzy_ceiling=50000
let g:fuzzy_ignore="./tmp"
let g:fuzzy_ignore=".git"
let g:fuzzy_ignore="*.png"
let g:fuzzy_ignore="*.jpg"
let g:fuzzy_ignore="*.gif"
let g:fuzzy_ignore="*.log"

" nmap <F2> :call Send_to_Screen('ruby -I"lib:test" test/functional/ubiquo/studies_controller_test.rb')<CR>
nmap <leader><leader>fu :Ack -w <cword><CR>
" alias [Shift-.] to [-] for fast command mode
nmap - :

" autotag
source ~/.vim/bundle/autotag/plugin/autotag.vim

" Tag navigation
nmap <C-c> :tag expand("<cword>")<CR>
nmap <C-x> :pop<CR>

nmap <M-n> :cn<CR>
nmap <M-p> :cp<CR>
