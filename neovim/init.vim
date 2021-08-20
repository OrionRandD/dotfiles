"              _
"   _ ____   "(_)"_ __ ___
"  | '_ \ \ / / | '_ ` _ \
"  | | | \ V /| | | | | | |
"  |_| |_|\_/ |_|_| |_| |_|
"
"

" nvim_plugins {
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
"}

" SuperTab {
let g:SuperTabDefaultCompletionType = "<c-n>" "it completes from up-down good for text-edition
"let g:SuperTabDefaultCompletionType = "<c-p>" "it completes from down-up - good for coding
"}

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,mk,mkd,mark,md,wiki setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Deoplete plugin {
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1
"}

""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
" """"""""""""""""""""""""""""""""""""""""""""""""""
 map <Left> :echo "no!"<CR>
 map <Right> :echo "no!"<CR>
 map <Up> :echo "no!" <CR>
 map <Down> :echo "no!" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Guifont {
 " set guifont=Sans\ Droid\ Mono\ Andale\ Regular\ 12,Droid\ Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 12
"} 

" Spellchecking {
 " setglobal spell spelllang=en_gb,es_es,pt_br " Start English, Spanish and Brazilian Portuguese spellchecking
 setglobal spell spelllang=br,en,es " Start English, Spanish and Brazilian Portuguese spellchecking
"} 

" http://vimawesome.com/plugin/vim-startify {

" Startify plugin

" Plugin '/home/vagner/.vim/bundle/vim-startify.vim/plugin/startify.vim'
" TODO sudo apt-get install fortune-mod cowsay
" TODO cd ~/.vim/bundle/vimtips-fortune/fortunes && strfile vimtips

" let g:startify_custom_header = map(split(system('fortune ~/.vim/bundle/vimtips-fortune/fortunes/vimtips | cowsay'), '\n'), '"   ". v:val') + ['','']

" let g:startify_custom_header = map(split(system('fortune | cowthink '), '\n'), '"   ". v:val') + ['','']
let g:startify_custom_header = map(split(system('verse | cowsay '), '\n'), '"   ". v:val') + ['','']

" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

"" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"General configuration {

set spell                   " Spell check on 
set t_co=256
set hidden
set mouse=a
set inccommand=split
" let mapleader="\<space>"
  let mapleader=","
 nnoremap <leader>ev :split ~/.config/nvim/init.vim<cr>
 nnoremap <leader>so :source ~/.config/nvim/init.vim<cr>
 nnoremap <c-p> :Files<cr>
 nnoremap <c-f> :Ag<space>


"}


" Color schemes {
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
set termguicolors
"} 

" Stealth commands {

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set linebreak           " Break long lines
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set relativenumber      " Show relative line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=2         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" }


" vimwiki with markdown support {"
" https://github.com/vimwiki/vimwiki
"https://github.com/gotbletu/shownotes/blob/master/vimwiki.md 
"https://www.youtube.com/watch?v=ONh95PNBW-Q 
 let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 
"}


" Clipboard {
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"}

" python3 host {
let g:python3_host_prog = "/usr/bin/python"

" for deoplete
" let g:python3_host_prog = $HOME."/usr/bin/python"

"}

" last position in file {
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }

" vim_hardtime {
" https://github.com/takac/vim-hardtime
" let g:hardtime_default_on = 1
" let g:hardtime_showmsg = 1
" let g:hardtime_ignore_quickfix = 1
" let g:hardtime_allow_different_key = 1
" let g:hardtime_maxcount = 2

 " }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" latex preview {
let g:livepreview_previewer = 'evince'
"""LATEX
"autocmd FileType tex nnoremap <C-p> :w<Enter>:!/home/kulade/Documents/latex/compile.sh<Space><C-R>%<Backspace><Backspace><Backspace><Backspace><Enter><Enter>
autocmd FileType tex nnoremap <C-p> :w<Enter>:!(setsid<Space>pdflatex<Space><C-R>%<Space>&><space>/dev/null&)<Enter><Enter>
autocmd FileType tex nnoremap <C-t> :w<Enter>:!bibtex<Space><C-R>%<Backspace><Backspace><Backspace><Backspace><Enter>
autocmd FileType tex nnoremap <C-o> :!<Space>setsid<Space>evince<Space><C-R>%<Backspace><Backspace><Backspace>pdf<Space>&><Space>/dev/null<Space>&<Enter><Enter>

autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter>(<>)<Enter><Enter>\end{frame}<Enter><Enter>(<>)<Esc>6kf}i
autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter>(<>)<Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter>(<>)<Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;it \textit{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;ct \citet{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;p \citep{}<Space>(<>)<Esc>T{i
" autocmd FileType tex inoremap ;glos {\gll<Space>(<>)<Space>\\<Enter>(<>)<Space>\\<Enter>\trans{``(<>)''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter>(<>)<Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter>(<>)<Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;t \begin{tabular}<Enter>(<>)<Enter>\end{tabular}<Enter><Enter>(<>)<Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;tab \begin{tableau}<Enter>\inp{(<>)}<Tab>\const{(<>)}<Tab>(<>)<Enter>(<>)<Enter>\end{tableau}<Enter><Enter>(<>)<Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab>(<>)<Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab>(<>)<Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab>(<>)<Esc>T{i
autocmd FileType tex inoremap ;a \href{}{(<>)}<Space>(<>)<Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter>(<>)<Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter>(<>)<Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter>(<>)<Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{%DELRN%}<Enter>(<>)<Enter>\end{%DELRN%}<Enter><Enter>(<>)<Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter>(<>)<Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"""END

"""Logical Symbols
autocmd FileType tex inoremap ;m $$<Space>(<>)<Esc>2T$i
autocmd FileType tex inoremap ;M $$<Esc>i
autocmd FileType tex inoremap ;neg {\neg}
autocmd FileType tex inoremap ;V {\vee}
autocmd FileType tex inoremap ;or {\vee}
autocmd FileType tex inoremap ;L {\wedge}
autocmd FileType tex inoremap ;and {\wedge}
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;dia	{\Diamond}
autocmd FileType tex inoremap ;box	{\Box}
"""END

autocmd Filetype tex inoremap ;nom {\textsc{nom}}
autocmd FileType tex inoremap ;acc {\textsc{acc}}
autocmd FileType tex inoremap ;dat {\textsc{dat}}
autocmd FileType tex inoremap ;gen {\textsc{gen}}
autocmd FileType tex inoremap ;abl {\textsc{abl}}
autocmd FileType tex inoremap ;voc {\textsc{voc}}
autocmd FileType tex inoremap ;loc {\textsc{loc}}
autocmd Filetype tex inoremap ;inst {\textsc{inst}}
"autocmd FileType tex inoremap ;

"""IPA
autocmd FileType tex inoremap ;tipa \textipa{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;ae {\ae}
autocmd FileType tex inoremap ;A {\textscripta}
autocmd FileType tex inoremap ;dh {\dh}
autocmd FileType tex inoremap ;yogh {\textyogh}
autocmd FileType tex inoremap ;j {\textdyoghlig}
autocmd FileType tex inoremap ;uh {\textschwa}
autocmd FileType tex inoremap ;eps {\textepsilon}
autocmd FileType tex inoremap ;gam {\textgamma}
autocmd FileType tex inoremap ;I {\textsci}
autocmd FileType tex inoremap ;sh {\textesh}
autocmd FileType tex inoremap ;th {\texttheta}
autocmd FileType tex inoremap ;ups {\textupsilon}
autocmd FileType tex inoremap ;ph {\textphi}
autocmd FileType tex inoremap ;om {\textomega}
autocmd FileType tex inoremap ;sig {\textsigma}
autocmd FileType tex inoremap ;oe {\oe}
autocmd FileType tex inoremap ;ng {\ng}
autocmd FileType tex inoremap ;au {\textopeno}
autocmd FileType tex inoremap ;O {\textopeno}
autocmd FileType tex inoremap ;glot {\textglotstop}
autocmd FileType tex inoremap ;ch {\textteshlig}
"""END

"""HTML
autocmd FileType html inoremap ;b <b></b><Space>(<>)<Esc>FbT>i
autocmd FileType html inoremap ;i <em></em><Space>(<>)<Esc>FeT>i
autocmd FileType html inoremap ;h1 <h1></h1><Enter><Enter><p>(<>)<Esc>2k2hi
autocmd FileType html inoremap ;h2 <h2></h2><Enter><Enter><p>(<>)<Esc>2k2hi
autocmd FileType html inoremap ;h3 <h3></h3><Enter><Enter><p>(<>)<Esc>2k2hi
autocmd FileType html inoremap ;p <p></p><Enter><Enter>(<>)<Esc>02kf>a
autocmd FileType html inoremap ;a <a<Space>href="">(<>)</a><Space>(<>)<Esc>14hi
autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter>(<>)<Esc>03kf<i
autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter>(<>)<Esc>03kf<i

"""END

""".bib
autocmd FileType bib inoremap ;a @article{<Enter><Tab>author<Space>=<Space>"(<>)",<Enter><Tab>year<Space>=<Space>"(<>)",<Enter><Tab>title<Space>=<Space>"(<>)",<Enter><Tab>journal<Space>=<Space>"(<>)",<Enter><Tab>volume<Space>=<Space>"(<>)",<Enter><Tab>pages<Space>=<Space>"(<>)",<Enter><Tab>}<Enter>(<>)<Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter><Tab>author<Space>=<Space>"(<>)",<Enter><Tab>year<Space>=<Space>"(<>)",<Enter><Tab>title<Space>=<Space>"(<>)",<Enter><Tab>publisher<Space>=<Space>"(<>)",<Enter><Tab>}<Enter>(<>)<Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter><Tab>author<Space>=<Space>"(<>)",<Enter><Tab>title<Space>=<Space>"(<>)",<Enter><Tab>booktitle<Space>=<Space>"(<>)",<Enter><Tab>editor<Space>=<Space>"(<>)",<Enter><Tab>year<Space>=<Space>"(<>)",<Enter><Tab>publisher<Space>=<Space>"(<>)",<Enter><Tab>}<Enter>(<>)<Esc>8kA,<Esc>i
"""END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Initialize plugin system {

" "Plugs dep {	
"Plug 'gmarik/vundle'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
Plug 'tomtom/tcomment_vim'
"Plug 'mileszs/ack.vim'
"}

" General {
Plug 'christoomey/vim-tmux-navigator'
""Plugs 'fholgado/minibufexpl.vim'
"Plug 'jszakmeister/vim-togglecursor'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'spf13/vim-colors'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
"Plug 'rhysd/conflict-marker.vim'
"Plug 'takac/vim-hardtime'
Plug 'jiangmiao/auto-pairs'
" this is problematic plugin for
" using "circumflex accent"
"Plug 'Townk/vim-autoclose'
"Plug 'garbas/vim-snipmate'
"Plug 'ervandew/snipmate.vim
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'tacahiroy/ctrlp-funky'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
"Plug 'Shougo/neossh.vim'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-notes'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'tyru/open-browser.vim'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'lervag/vimtex'
"Plug 'sotte/presenting.vim'
"Plug 'vim-scripts/sessionman.vim'
Plug 'ervandew/supertab'
" "Plug 'FredKSchott/CoVim'
" "Plug 'hobbestigrou/vimtips-fortune'
"Plug 'beloglazov/vim-online-thesaurus'
"Plug 'vim-scripts/DrawIt'
Plug 'mhinz/vim-startify'
"Plug 'thinca/vim-unite-history'
Plug 'vimwiki/vimwiki'
"Plug 'Rykka/mathematic.vim'
"Plug 'Shougo/deoplete.nvim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'vim-scripts/Conque-Shell'
"Plug 'matchit.zip'
"Plug 'Lokaltog/vim-powerline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'powerline/fonts'
"Plug 'bling/vim-bufferline'
Plug 'easymotion/vim-easymotion'
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'flazz/vim-colorschemes'
"Plug 'mbbill/undotree'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'vim-scripts/restore_view.vim'
"Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-abolish.git'
"Plug 'osyo-manga/vim-over'
"Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-textobj-indent'
"Plug 'gcmt/wildfire.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf/bin/fzf', 'do': './install --all' }
Plug 'junegunn/fzf'

"}

" Writing {
"Plug 'reedes/vim-litecorrect'
"Plug 'reedes/vim-textobj-sentence'
"Plug 'reedes/vim-textobj-quote'
"Plug 'reedes/vim-wordy'
Plug 'jcf/vim-latex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'roxma/nvim-completion-manager'
Plug 'vim-scripts/loremipsum'
"Plug 'lifepillar/vim-mucomplete'
"Plug 'reedes/vim-litecorrect'
Plug 'jceb/vim-orgmode'
"Plug 'tpope/vim-speeddating'
"Plug 'chrisbra/NrrwRgn'
"Plug 'mattn/calendar-vim'
"Plug 'inkarkat/vim-SyntaxR


" fix for nvim-completion-manager core channel 
" terminated
" https://github.com/luan/vimfiles/issues/124
" sed -i.bu 's/async=True/**{"async": True}/' ~/.config/nvim/plugged/nvim-completion-manager/pythonx/cm.py
" sed -i.bu 's/async=True/**{"async": True}/' ~/.config/nvim/plugged/nvim-completion-manager/pythonx/cm_core.py

"}

" General programming {
Plug 'pulkomandy/c.vim'
"Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-fugitive'
"Plug 'mattn/webapi-vim'
"Plug 'mattn/gist-vim'
"Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
"Plug 'tpope/vim-dispatch.git'
""Plug 'OmniSharp/Omnisharp-vim'
"Plug 'OmniSharp/omnisharp-roslyn'
"Plug 'vim-scripts/VimClojure'
"Plug 'tpope/vim-fireplace'
""Plug 'martylamb/nailgun'
"Plug 'luochen1990/rainbow'
"Plug 'jplaut/vim-arduino-ino'
"Plug 'kovetskiy/sxhkd-vim'
"Plug 'baskerville/vim-sxhkdrc'
"Plug 'derekwyatt/vim-scala'
""Plug 'ensime/ensime-vim'
"Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
"}

" Snippets and autocomplete {
"Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
"Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'Shougo/neocomplcache'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'honza/vim-snippets'
"Plug 'Shougo/neocomplete.vim'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'honza/vim-snippets'
"}

" PHP programming {
"Plug 'spf13/PIV'
"Plug 'arnaud-lb/vim-php-namespace'
"Plug '2072/PHP-Indenting-for-VIm'
"Plug 'beyondwords/vim-twig'
"}

" Python {

Plug 'klen/python-mode'
Plug 'yssource/python.vim'
"Plug 'python_match.vim'
"Plug 'pythoncomplete'

"}

" Javascript {
"Plug 'elzr/vim-json'
"Plug 'groenewege/vim-less'
"Plug 'pangloss/vim-javascript'
"Plug 'vim-scripts/JavaScript-Indent'
"Plug 'hallettj/jslint.vim'
"Plug 'davidhalter/jedi-vim'
"Plug 'ternjs/tern_for_vim'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'briancollins/vim-jst'
"Plug 'kchmck/vim-coffee-script'
" }

" Scala {
"Plug 'derekwyatt/vim-scala'
"Plug 'derekwyatt/vim-sbt'
"Plug 'xptemplate'
" }

" Haskell {
"Plug 'travitch/hasksyn'
"Plug 'dag/vim2hs'
"Plug 'Twinside/vim-haskellConceal'
"Plug 'Twinside/vim-haskellFold'
"Plug 'lukerandall/haskellmode-vim'
"Plug 'eagletmt/neco-ghc'
"Plug 'eagletmt/ghcmod-vim'
"Plug 'Shougo/vimproc.vim'
"Plug 'adinapoli/cumino'
"Plug 'bitc/vim-hdevtools'
" }

" HTML {
"Plug 'amirh/HTML-AutoCloseTag'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'gorodinskiy/vim-coloresque'
"Plug 'tpope/vim-haml'
"Plug 'mattn/emmet-vim'
" }

" Ruby {
"Plug 'tpope/vim-rails'
"let g:rubycomplete_buffer_loading = 1
"let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1
" }

" Puppet {
"Plug 'rodjek/vim-puppet'
" }

" Go Lang {
""Plug 'Blackrush/vim-gocode'
"Plug 'fatih/vim-go'
" }

" Elixir {
"Plug 'elixir-lang/vim-elixir'
"Plug 'carlosgaldino/elixir-snippets'
"Plug 'mattreduce/vim-mix'
" }

" Misc {
"Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-markdown'
"Plug 'spf13/vim-preview'
"Plug 'tpope/vim-cucumber'
"Plug 'cespare/vim-toml'
"Plug 'quentindecock/vim-cucumber-align-pipes'
"Plug 'saltstack/salt-vim'
" }

call plug#end()
"}

" dude git
"

