execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible  " not compatible with the old-fashion vi mode
set bs=2          " allow backspacing over everything in insert mode
set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set autoread      " auto read when file is changed from outside

filetype plugin indent on
syntax on
set hlsearch
set showmatch

set cursorline
set encoding=utf-8
set lazyredraw
set expandtab
set shiftwidth=2
set softtabstop=2

set laststatus=2
"set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"let g:airline_powerline_fonts = 1
" unicode symbols
let g:airline_left_sep = '▶'
"let g:airline_left_sep = '❱'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '«'
"let g:airline_linecolumn_prefix = '␊ '
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr
"let g:airline_linecolumn_prefix = '¶'
"let g:airline_branch_prefix = '⎇'
"let g:airline_paste_symbol = 'ρ'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_paste_symbol = 'Þ'
"let g:airline_paste_symbol = '∥'

"let g:airline_theme='dark'
"let g:airline_theme='powerlineish'
"let g:airline_theme='ubaryd'
let g:airline_theme='luna'
set timeoutlen=1

"↩ ↪  ⎗⎘⎚⎙␀␛ ␡⑂⑁⑊♩ ♪♫ ➥ ➦ ➧¶§█░▒▓
"set list
"set listchars=eol:

"let g:airline#extensions#tabline#enabled = 1
"      \ '__' : '------'
"      \ 'n'  : 'NORMAL'
"      \ 'i'  : 'INSERT'
"      \ 'R'  : 'REPLACE'
"      \ 'c'  : 'COMMAND'
"      \ 'v'  : 'VISUAL'
"      \ 'V'  : 'V-LINE'
"      \ '^V' : 'V-BLOCK'
"      \ 's'  : 'SELECT'
"      \ 'S'  : 'S-LINE'
"      \ '^S' : 'S-BLOCK'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : '⌘',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '^V' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '^S' : 'S',
      \ }

autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
