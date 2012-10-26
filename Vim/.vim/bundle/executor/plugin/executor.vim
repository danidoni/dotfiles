function! s:Launch(args)
  redraw
  echo "Launching ..."

  silent execute a:args
  botright copen
endfunction

command! -bang -nargs=* -complete=file Launch call s:Launch(<q-args>)
