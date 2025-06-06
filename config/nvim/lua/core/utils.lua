-- ~/.config/nvim/lua/core/utils.lua

-- Keep complex vimscript functions as-is, wrapped in a heredoc
vim.cmd([[
  " Returns true if paste mode is enabled
  function! HasPaste()
    if &paste
      return 'PASTE MODE  '
    endif
    return ''
  endfunction

  " Don't close window, when deleting a buffer
  command! Bclose call <SID>BufcloseCloseIt()
  function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
      buffer #
    else
      bnext
    endif

    if bufnr("%") == l:currentBufNum
      new
    endif

    if buflisted(l:currentBufNum)
      execute("bdelete! ".l:currentBufNum)
    endif
  endfunction

  function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
      call feedkeys(":" . "Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
      call feedkeys(":" . "%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
  endfunction
  
  " Make searching for visual selection work
  vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
  vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

  " Delete trailing white space on save, useful for some filetypes ;)
  fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfun

  if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
  endif
]])
