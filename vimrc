" -------------------------------------------------------------------------
" Created by: 	Jared Bernard
" Date: 	June 21, 2018
" Note: 	Created to be an IDE for Introduction to Programming class.
" 		    Optimized and designed for Python.

" --------------------------------------------------------------------------		
" PATHOGEN SETTINGS
" Pathogen is a plugin manager for vim
" To install Pathogen - git clone to .vim/bundle dir to install plugin
" Pathogen needs to run before plugin indent on
filetype off 
execute pathogen#infect() 
" call pathogen#runtime_append_all_bundles()
" generate helptags for everything in 'runtimepath'
call pathogen#helptags() 
filetype plugin indent on

" ---------------------------------------------------------------------------
" PLUGINS 
" The following plugins are located in ~/.vim/bundle
" supertab - autocomplete tags using tab
" autoclose - auto creates closing brackets
" powerline - cool status bar
" nerdtree - file browser opening as left panel
" vim-dues - Feel and look theme for vim

" --------------------------------------------------------------------------
" GENERAL SETTINGS
" set encoding to common english
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11
" Wrap words with clean line breaks.
set wrap
set linebreak
" Synatax highlighting
syntax on
" When re-opening file, return to last location in file.
set autowriteall
" have backspace key work like other programs
set backspace=indent,eol,start 
"Use ctrl+c and then enter to run your current script. Must be executable.
map <C-C> :!clear && ./%  

"----------------------------------------------------------------------------
" THEME VIM-DEUS SETTINGS
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark " Setting dark mode
colorscheme deus
let g:deus_termcolors=256

" -------------------------------------------------------------------------- 
" PYTHON SPECIFIC SETTINGS
set ts=4 " tab to 4 spaces
set autoindent " indent when moving to the next line while writing code
set expandtab " expand tabs into spaces
set shiftwidth=4 " when using the >> or << commands, shift lines by 4 spaces
set showmatch " show the matching part of the pair for [] {} and ()
let python_highlight_all = 1 " enable all Python syntax highlighting features

" ----------------------------------------------------------------------------
" POWERLINE SETTINGS
set  rtp+=/home/jared/.vim/bundle/powerline/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" ----------------------------------------------------------------------------
" HELP FUNCTION
" Provides a cheatsheet of the plugins and functions available in this
" configuration. 
function! Help ()
	!clear && cat ~/.vim/help.txt	
endfunction
map <F1> :call Help()<CR>

" -----------------------------------------------------------------------------
" TERMINAL FUNCTION
" Open Terminal using F4 
function! Terminal()
vert term 
echo "Terminal Opened."
endfunction
map <F4> :call Terminal()<CR>

" -----------------------------------------------------------------------------
" LINE NUMBERING FUNCTION
" Toggle line numbering on and off by using F5.
function! ToggleNum()
        set number!
        if &number
          echo "Line Numbers ON"
        else
          echo "Line Numbers OFF"
        endif
      endfunction
map <F5> :call ToggleNum()<CR>

" -----------------------------------------------------------------------------
" NERDTREE PLUGIN SETTINGS
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('sql', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('txt', 'Gray', 'none', 'Gray', '#151515')
call NERDTreeHighlightFile('py', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

function! ToggleNERDTree()
    set encoding=utf8
    autocmd FileType nerdtree setlocal nolist
    NERDTreeToggle
endfunction
" map NERDTree plugin to F10 - filesystem tree left
map <F10> :call ToggleNERDTree()<CR>
