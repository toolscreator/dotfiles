""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: toolscreator
"             toolscreator@outlook.com
"
" Version: 1.0 - 2015.3.3
" Version: 2.0 - 2015.9.1
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Parenthesis/bracket expanding
"    -> General Abbrevs
"    -> Editing mappings
"    -> Vunble
"    -> Cope
"    -> Minibuffer plugin
"    -> Omni complete functions
"    -> Python section
"    -> JavaScript section
"    -> LLVM section
" Plugins_Included:
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Vundle {{{
set nocompatible    " be iMproved
filetype off        " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required!
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
"
Plugin 'AutoClose'

Plugin 'taglist.vim'
Plugin 'winmanager'
Plugin 'bufexplorer.zip'
Plugin 'genutils'
Plugin 'lookupfile'

Plugin 'vimwiki'

Plugin 'gdbvim.tar.gz'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'snipMate'
Plugin 'Shougo/neocomplete'
Plugin 'SuperTab'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required!
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" => Vundle }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => General {{{
"Get out of VI's compatible mode..
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>f :find<cr>

" Fast reloading of the .vimrc
map <silent> <leader>s :source ~/.vimrc<cr>
" When vimrc is edited, reload it
autocmd! bufwritepost ~/.vimrc source ~/.vimrc
""autocmd! filewritepost vimrc source ~/.vimrc
autocmd FileType vim map :w!:source %

" Fast editing of the .vimrc
map <silent><leader>e :e! ~/.vimrc<cr>
"map <silent> <leader>e :call SwitchToBuf("~/.vimrc")<cr>

map <C-c> <Esc>
map <F8> I// <Esc>
" execute project related configuration in current directory
if filereadable("workspace.vim")
    source workspace.vim
endif
" General end }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface {{{
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

""set cmdheight=2 "The commandbar height

set nu "Show line number

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set vb t_vb=
set tm=500
set cc=81
" VIM user Interface }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl
syntax on

set gfn=Monaco:h18
"set gfn=Monospace\ 12
set ambiwidth=double

if has("gui_running")
  set guioptions-=T
  set linespace=2
  ""set lines=40
  set lines=100
  ""set columns=90
  set columns=110
  set t_Co=256
  "set background=light
  colorscheme macvim
else
  "set background=dark
  "colorscheme desert
endif

try
    lang en_US
catch
endtry

"let &termencoding=&encoding
"set fenc=utf-8
set enc=utf-8
"set tenc=utf-8
set fencs=utf-8,gb18030,ucs-bom,gbk,cp936,gb2312,big5,latin1

set ffs=unix,dos,mac "Default file types
"nmap <leader>fd :se ff=dos<cr>
"nmap <leader>fu :se ff=unix<cr>
" Colors and Fonts }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
"set nobackup
""set nowb
""set noswapfile
set backupdir=~/.tmp

"Persistent undo
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry
" Files, backups and undo }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>

set lbr
set tw=500
set formatoptions+=mM

set ai "Auto indent
set si "Smart indet
set cindent "C-style indeting
"setlocal cino=t0 "For C/C++ indecting

set wrap "Wrap lines

set fen "Enable folding
"set foldmethod=syntax
set foldmethod=marker
set foldlevel=100
nnoremap <space> za
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" => Text, tab and indent related }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <tab> >gv
vmap <s-tab> <gv

" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" => Visual mode related }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd

" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  if g:cmd == g:cmd_edited
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc
" => Command mode related }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful when moving accross long lines
map j gj
map k gk

" This is totally awesome - remap jj to escape in insert mode.
" You'll never type jj anyway, so it's great!
inoremap jj <Esc>

nnoremap JJJJ <Nop>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set sessionoptions-=curdir
set sessionoptions+=sesdir

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" When I close a tab, remove the buffer
set nohidden

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>
map <leader>cd1 :cd ..<cr>
map <leader>cd2 :cd ../..<cr>
map <leader>cd3 :cd ../../..<cr>

" cd to the current file's directory
noremap gc :lcd %:h<Cr>

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

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" Return to last edit position (You want this!) *N*
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"Remeber open buffers on close
set viminfo^=%
" => Moving around, tabs and buffers }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

"Git branch
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

" Format the statusline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"set statusline=%<[%n]%F\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][ASCII=\%03.3b]%-10.(%l,%c%V%)\ %P
set statusline=%F%r%h%w\ %=\[%{&encoding}]\ [ASCII=\%03.3b]\ [0x\%02.2B]\ [%l/%L,%c]\ %p%%

"Nice statusbar
"set statusline=
"set statusline+=%2*%-3.3n%0*\  " buffer number
""set statusline+=%f\  " file name
"set statusline+=%h%1*%m%r%w%0* " flag
"set statusline+=%{HasPaste()} " Paste Mode
"set statusline+=[%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding}, " encoding
"set statusline+=%{&fileformat}] " file format
"
"set statusline+=%= " right align
""set statusline+=%2*0x%-8B\ " current char
"set statusline+=0x%-8B\  " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

function! CurDir()
    return substitute(getcwd(), '/Users/Lattner/', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
" => Statusline }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expandinga {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>
"
"" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i
"inoremap $t <><esc>i

" 括号自动补全
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
"":inoremap { {}<ESC>i
"":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
""
""function! ClosePair(char)
""	if getline('.')[col('.') - 1] == a:char
""		return "\<Right>"
""	else
""		return a:char
""	endif
""endf
" => Parenthesis/bracket expandinga }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xname LattnerGang
" => General Abbrevs }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nmap <tab> v>
nmap <s-tab> v<

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t

set comments=:// "单行注释
set comments=s1:/*,mb:*,ex0:/ "段落注释

" Add use <CWORD> at the top of the file
function! UseWord(word)
       let spec_cases = {'Dumper': 'Data::Dumper'}
       let my_word = a:word
       if has_key(spec_cases, my_word)
               let my_word = spec_cases[my_word]
       endif

       let was_used = search("^use.*" . my_word, "bw")

       if was_used > 0
               echo "Used already"
               return 0
       endif

       let last_use = search("^use", "bW")
       if 0 == last_use
               last_use = search("^package", "bW")
               if 0 == last_use
                       last_use = 1
               endif
       endif

       let use_string = "use " . my_word . ";"
       let res = append(last_use, use_string)
       return 1
endfunction

function! UseCWord()
       let cline = line(".")
       let ccol = col(".")
       let ch = UseWord(expand("<cword>"))
       normal mu
       call cursor(cline + ch, ccol)

endfunction

function! GetWords(pattern)
       let cline = line(".")
       let ccol = col(".")
       call cursor(1,1)

       let temp_dict = {}
       let cpos = searchpos(a:pattern)
       while cpos[0] != 0
               let temp_dict[expand("<cword>")] = 1
               let cpos = searchpos(a:pattern, 'W')
       endwhile

       call cursor(cline, ccol)
       return keys(temp_dict)
endfunction

" Append the list of words, that match the pattern after cursor
function! AppendWordsLike(pattern)
       let word_list = sort(GetWords(a:pattern))
       call append(line("."), word_list)
endfunction

""nnoremap <F7>  :call UseCWord()<CR>

function! DeleteRedundantSpaces()
       let cline = line(".")
       let ccol = col(".")
       silent! %s/\s\+$//g
       call cursor(cline, ccol)
endfunction
"au BufWrite * call DeleteRedundantSpaces()

" Better Marks
nnoremap ' `
" => Editing mappings }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>
" => Cope }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize = 30
let g:bufExplorerUseCurrentWindow=1
"let g:bufExplorerMaxHeight=13

map <leader>o :BufExplorer<cr>
autocmd BufWinEnter \[Buf\ List\] setl nonumber
" => bufExplorer plugin }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Minibuffer plugin {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:miniBufExplSplitBelow = 0
let g:miniBufExplMaxSize = 3
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 4
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplMapCTabSwitchBufs = 1

""autocmd BufRead,BufNew :call UMiniBufExplorer

""map <leader>t :TMiniBufExplorer<cr>
" => Minibuffer plugin }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist plugin {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
"let Tlist_Inc_Winwidth = 0
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 20

"nnoremap <silent> <F8> :TlistToggle<CR>
"inoremap <silent> <F8> <Esc>:TlistToggle<CR><Esc>

set tags+=tags
function! AutoLoadCTagsAndCScope()
    let max = 5
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'cscope.out')
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if filereadable(dir . 'tags')
            execute 'set tags =' . dir . 'tags'
            let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endfunction
"nmap <F7> :call AutoLoadCTagsAndCScope()<CR>
""autocmd BufAdd,BufRead,TextChanged :call AutoLoadCTagsAndCScope()
autocmd BufEnter :call AutoLoadCTagsAndCScope()

set autochdir
" => Taglist plugin }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoComplCache plugin {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:neocomplcache_enable_at_startup = 1   " 开启终极智能补全插件neocomplcache
"let g:neocomplcache_enable_smart_case = 1   " Use smartcase
"let g:neocomplcache_min_syntax_length = 3   " Set minimum synatax keyword length
"let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
"inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
"let g:neocomplcache_nable_quick_match = 1
"For input-saving, this variable controls whether you can  choose a candidate with a alphabet or number displayed beside a candidate after '-'.  When you input 'ho-a',  neocomplcache will select candidate 'a'.  启动快速匹配
" => NeoComplCache plugin }}}

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lookupfile plugin {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")               "设置tag文件的名字
	let g:LookupFile_TagExpr = '"./filenametags"'
endif
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>
" => lookupfile setting }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => winManager plugin  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 20
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <F9> :WMToggle<cr>
nmap <silent> <leader>wu :wa<cr>:TlistUpdate<cr>:FirstExplorerWindow<cr>
" => winManager plugin  }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cscope plugin  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetagorder=1
set cscopetag
set nocsverb
set cscopepathcomp=3
"cs add ./cscope.out
set csverb

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" => cscope plugin  }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" => Omni complete functions }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" => Spell checking }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LaTeX Suite things {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf='xpdf'

"Bindings
autocmd FileType tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

"Auto complete some things ;)
autocmd FileType tex inoremap $i \indent
autocmd FileType tex inoremap $* \cdot
autocmd FileType tex inoremap $i \item
autocmd FileType tex inoremap $m \[<cr>\]<esc>O
" => LaTeX Suite things }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim section {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType vim set nofen
" => Vim section }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CPP section {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype
  au! BufRead,BufNewFile *.tpp     set filetype=cpp
augroup END
" => CPP section }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python section {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
" => Python section }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ASM section {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.ASM set ft=asm
" => ASM section }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LLVM_file section {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight trailing whitespace from LLVM_vimrc
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

" Set a few indentation parameters. See the VIM help for cinoptions-values for
" details.  These aren't absolute rules; they're just an approximation of
" common style in LLVM source.
set cinoptions=:0,g0,(0,Ws

" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Useful macros for cleaning up code to conform to LLVM coding guidelines
" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//
" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

augroup filetype
  au! BufRead,BufNewFile *.def     set filetype=cpp
augroup END

augroup filetype
  au! BufRead,BufNewFile *.inc     set filetype=cpp
augroup END
" => LLVM_file section }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-T {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>
" => Command-T }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim grep {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH
" => Vim grep }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Remove indenting on empty lines
map <F4> :%s/\s*$//g<cr>:noh<cr>''

"对NERD_commenter的设置
let NERDShutUp=1

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"A function that inserts links & anchors on a TOhtml export.
" Notice:
" Syntax used is:
"   *> Link
"   => Anchor
function! SmartTOHtml()
   TOhtml
   try
    %s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
   catch
   endtry
   exe ":write!"
   exe ":bd"
endfunction

"Quickly open a buffer for scripbble
map <leader>eb :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

"----------------below for txt file
""让文本文件也有高亮，thanks to xbeta@smth
autocmd FileType txt    set ts=3
autocmd FileType txt    set tw=78
autocmd FileType txt    set expandtab
augroup filetypedetect
  au BufNewFile,BufRead *.txt setf ztxt
augroup END

let g:calendar_diary ="g:\\Pri\\calendar"

if has("eval")
    let cpo_save=&cpo
endif

set cpo=B
" TVO defaults:
let otl_install_menu=1
let no_otl_maps=0
let no_otl_insert_maps=0

" overrides:
let otl_bold_headers=0
let otl_use_thlnk=0

let maplocalleader = ","

map <leader>ct :cd ~/Desktop/Todoist/todoist<cr>
map <leader>cw :cd ~/Desktop/Wedoist/wedoist<cr>
map <leader>cp :cd ~/Desktop/PlurkGit/trunk<cr>
" => MISC }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compile {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set makeprg=gcc\ -g\ -ansi\ -Wall\ -o\ %<\ %
" => Compile }}}
