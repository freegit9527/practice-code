let g:quote = 'A poet can but ill spare time for prose.'
function! EchoQuote(quote, ...)
  ""let year = a:1
  let year = a:000[0]

  ""let author = a:000[1]
  let author = a:2
  echo 'In ' . year . ', ' . author . ' said: "' . a:quote . '"'
endfunction

call EchoQuote('A poet can but ill spare time for prose.',
      \'1784', 'liu')

function! EchoQuote1()
  let l:quote = 'Local: A poet can but ill spare time for prose.'
  return l:quote
endfunction

call EchoQuote1()
