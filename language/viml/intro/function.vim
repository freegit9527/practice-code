let g:quote = 'A poet can but ill spare time for prose.'
function! EchoQuote(quote, ...)
  ""let year = a:1 equals to:
  let year = a:000[0]

  ""let author = a:000[1] equals to:
  let author = a:2
  echo 'In ' . year . ', ' . author . ' said: "' . a:quote . '"'
endfunction

call EchoQuote('A poet can but ill spare time for prose.',
      \'1784', 'liu')

function! EchoQuote1()
  let l:quote = 'Local: A poet can but ill spare time for prose.'
  return l:quote
endfunction

let Example = function('EchoQuote1')
echo call(Example, [])

function! EchoQuote2(quote, ...)
  let year = a:1
  let author = a:000[1]
  return 'In ' . year . ', ' . author . ' said: "' . a:quote . '"'
endfunction

let Example = function('EchoQuote2')
let q = 'Hello, world~'
echo call(Example, [q, '2017', "xueyangliu"])

echo string(Example)

let animal = ['dog', 'cat']
echo animal

call add(animal, 'chicken')
echo animal

call remove(animal, 1)
echo animal[1]

call insert(animal, 'octopus', 1)
echo animal

echo sort(animal)
echo animal


