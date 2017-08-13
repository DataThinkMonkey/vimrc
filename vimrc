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
" ----------------------------
" PLUGINS
" supertab - autocomplete tags using tab
" autoclose - auto creates closing brackets
" closetag - ctrl+_ will add html closing tag </whatever>
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
" F6 turns on word processing mode
" This auto formats wrap in lines and paragraphs. 
func! WordProcessorMode() 
  Goyo
  let g:limelight_conceal_ctermfg = 240
  Limelight
  map j gj 
  map k gk
  set tw=80
  set wrap
  set linebreak
  set mouse=a
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
"vim-geeknote plugin mapped to F8
func! Gnote()
  Geeknote
  let g:GeeknoteFormat="markdown"
  set mouse=a
  setlocal spell spelllang=en_us 
endfu 
map <F8> :call Gnote() <CR>  
"noremap <F8> :Geeknote<CR>
"-----------------------------
" map NERDTree plugin to F10 - filesystem tree left
map <F10> :NERDTreeToggle<CR>
"----------------------------
" Quickmenu Help F12
" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"

" clear all the items
call g:quickmenu#reset()

" choose a favorite key to show/hide quickmenu
noremap <silent><F12> :call quickmenu#toggle(0)<cr>

"text will be show in the quickmenu, vimscript in %{...} will be evaluated and expanded.
"action is a piece of vimscript to be executed when a item is selected.
"help will display in the cmdline if g:quickmenu_options contains H.
" function quickmenu#append(text, action [, help = ''])

" section 1, text starting with "#" represents a section (see the screen capture below)
call g:quickmenu#header('QuickMenu')
call g:quickmenu#append('# Help - Plugins', '')

call g:quickmenu#append('F2 - Calendar', 'call Cal ()', 'Selected Google Calendar')
call g:quickmenu#append('F3 - Python Mode', 'call ProgPyMode()', 'Selected Python Mode')
call g:quickmenu#append('F6 - Word Processor', 'call WordProcessorMode()', 'Word Processor Mode')
call g:quickmenu#append('F8 - Geeknote', 'call Gnote()', 'Geeknote Menu')
call g:quickmenu#append('F10 - NerdTree', 'NERDTreeToggle', 'NerdTree')

call g:quickmenu#append('# Pandoc', '')
call g:quickmenu#append('# Import Templates', '')
call g:quickmenu#append('# Git', '')

" To-do
" git
" pandoc convert
" thesaurus
" template list
" " Chapter Reviews
" " Lab
" " scripts, etc
" can add to another menu call quickmenu#current(1)

