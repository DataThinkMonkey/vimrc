" Pathogen - git clone to .vim/bundle dir to install plugin
filetype off " Pathogen needs to run before plugin indent on
execute pathogen#infect() 
"call pathogen#runtime_append_all_bundles()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on
"-----------------------------
"SETTINGS
set wrap
set linebreak
"line numbering
"set number
syntax on
"Set autosave
set autowriteall
set backspace=indent,eol,start " have backspace key work like other programs
"Use ctrl+c and then enter to run your current script. Must be executable.
map <C-C> :!clear && ./%  
" ----------------------------
" PLUGINS
" supertab - autocomplete tags using tab
" autoclose - auto creates closing brackets
" closetag - ctrl+_ will add html closing tag </whatever>
" thesaurus plugin, type :Thesaurus <word>  
" goyo - Used for Word Processing mode, adds margins, blocks and centers text
" Calendar - you google calendar in vim
" limelight - highlights current paragraph, softens other paragraphs 
" powerline - cool status bar
set  rtp+=/home/jared/.vim/bundle/powerline/powerline/bindings/vim/
set laststatus=2
set t_Co=256
" --------------------------
function! Help ()
	!clear && cat ~/.vim/help.txt	
endfunction
map <F1> :call Help()<CR>
" ---------------------------
" Calendar F2
function! Cal ()
let g:calendar_google_calendar = 1
Calendar -view=week
Calendar -view=year -split=horizontal -position=below -height=12
endfunction
map <F2> :call Cal()<CR>

" --------------------------
"function to enable program mode particularly for python
func! ProgPyMode()
 set ts=4 " tab to 4 spaces
 set autoindent " indent when moving to the next line while writing code
 set expandtab " expand tabs into spaces
 set shiftwidth=4 " when using the >> or << commands, shift lines by 4 spaces
 set showmatch " show the matching part of the pair for [] {} and ()
 let python_highlight_all = 1 " enable all Python syntax highlighting features
 echo "Programming Python Mode"
endfu
map <F3> :call ProgPyMode()<CR>
"----------------------------
"Open Terminal using F4 
function! Terminal()
vert term 
echo "Terminal Opened."
endfunction
map <F4> :call Terminal()<CR>
"----------------------------
"Toggle spelling on and off by using F5.
function! ToggleSpellCheck()
        set spell!
        if &spell
          echo "Spell Check ON"
        else
          echo "Spell Check OFF"
        endif
      endfunction
map <F5> :call ToggleSpellCheck()<CR>
"----------------------------
"F6 turns on word processing mode
	"This auto formats wrap in lines and paragraphs. 
	func! WordProcessorMode() 
  Goyo
  let g:limelight_conceal_ctermfg = 240
  Limelight
  map j gj 
  map k gk
  set tw=80
  set wrap
  set linebreak
  setlocal spell spelllang=en_us 
   " Display status bar
    set laststatus=2
   """""""""""""""""""""
   " Beginning of auto word count
   """""""""""""""""""""
   let g:word_count="<calculating>"
    function WordCount()
       return g:word_count
    endfunction
   function UpdateWordCount()
    let lnum = 1
    let n = 0
     while lnum <= line('$')
    let n = n + len(split(getline(lnum)))
    let lnum = lnum + 1
     endwhile
    let g:word_count = n
   endfunction
   "" Update the count when cursor is idle in command or insert mode.
   "" Update when idle for 1000 msec (default is 4000 msec).
   set updatetime=1000
   augroup WordCounter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
   augroup END
	"" Set statusline, shown here a piece at a time
	highlight User1 ctermbg=blue guibg=green ctermfg=white guifg=black
	set statusline=%1*            " Switch to User1 color highlight
	set statusline+=%<%f            " file name, cut if needed at start
	set statusline+=%M            " modified flag
	set statusline+=%y            " file type
	set statusline+=%=            " separator from left to right justified
	set statusline+=\ %{WordCount()}\ words,
	set statusline+=\ %l/%L\ lines,\ %P    " percentage through the file
   " end status bar
  echo "Word Processing Mode"
endfu 
map <F6> :call WordProcessorMode()<CR>
"----------------------------
"Toggle spelling on and off by using F5.
function! ToggleNum()
        set number!
        if &number
          echo "Line Numbers ON"
        else
          echo "Line Numbers OFF"
        endif
      endfunction
map <F7> :call ToggleNum()<CR>
"-----------------------------
"vim-geeknote plugin mapped to F8
func! Gnote()
  Geeknote
  let g:GeeknoteFormat="markdown"
endfu 
map <F8> :call Gnote() <CR>  
"noremap <F8> :Geeknote<CR>
"-----------------------------
" map NERDTree plugin to F10 - filesystem tree left
map <F10> :NERDTreeToggle<CR>

