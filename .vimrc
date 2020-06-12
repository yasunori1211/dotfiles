call plug#begin('~/.vim/plugged')

 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'    " doesn't work (2019/4/14)

 " Modified plugin
 Plug 'tyru/caw.vim'
 Plug 'tpope/vim-surround'

 " Programing Launguage plugin
 Plug 'othree/html5.vim'
 Plug 'mattn/emmet-vim'
 Plug 'pangloss/vim-javascript'
 Plug 'StanAngeloff/php.vim'
 Plug 'captbaritone/better-indent-support-for-php-with-html'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

 " Git plugin
 Plug 'kmnk/vim-unite-giti'
 Plug 'airblade/vim-gitgutter'

 Plug 'Shougo/deoplete.nvim'
 Plug 'roxma/nvim-yarp'    " For using deoplete
 Plug 'roxma/vim-hug-neovim-rpc'    " For using deoplete

 " 
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'edkolev/tmuxline.vim'

 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'regedarek/ZoomWin'

 Plug 'tpope/vim-fugitive'

 Plug 'godlygeek/tabular'
 Plug 'plasticboy/vim-markdown'
 Plug 'previm/previm'
 Plug 'habamax/vim-asciidoctor'

 call plug#end()

filetype plugin indent on
syntax enable

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"文字コード変更
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" setting
" 自動補完の色設定
 set pumheight=10
 hi Pmenu ctermbg=black ctermfg=white guifg=#000000 guibg=#999999
 hi PmenuSel ctermbg=blue ctermfg=white
 hi PmenuSbar ctermbg=0 ctermfg=9
 hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF
" "文字コードをUFT-8に設定
 set fenc=utf-8
" " バックアップファイルを作らない
 set nobackup
" " スワップファイルを作らない
 set noswapfile
" " 編集中のファイルが変更されたら自動で読み直す
 set autoread
" " バッファが編集中でもその他のファイルを開けるように
 set hidden
" " 入力中のコマンドをステータスに表示する
 set showcmd
"
"
" " 見た目系
" " 行番号を表示
 set number
" " 現在の行を強調表示
 set cursorline
" " 現在の行を強調表示（縦）
" set cursorcolumn
" " 行末の1文字先までカーソルを移動できるように
 set virtualedit=onemore
" " インデントはスマートインデント
 set smartindent
" " ビープ音を可視化
 set visualbell
" " 括弧入力時の対応する括弧を表示
 set showmatch
" " ステータスラインを常に表示
 set laststatus=2
" " コマンドラインの補完
 set wildmode=list:longest
" " 折り返し時に表示行単位での移動できるようにする
 nnoremap j gj
 nnoremap k gk
"
"
" " Tab系
" " 不可視文字を可視化(タブが「▸-」と表示される)
 set list listchars=tab:\▸\-
" " Tab文字を半角スペースにする
 set expandtab
" " 行頭以外のTab文字の表示幅（スペースいくつ分）
 set tabstop=4
" " 行頭でのTab文字の表示幅
 set shiftwidth=4
"
"
" " 検索系
" " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
 set ignorecase
" " 検索文字列に大文字が含まれている場合は区別して検索する
 set smartcase
" " 検索文字列入力時に順次対象文字列にヒットさせる
 set incsearch
" " 検索時に最後まで行ったら最初に戻る
 set wrapscan
" " 検索語をハイライト表示
 set hlsearch
" " ESC連打でハイライト解除
 nmap <Esc><Esc> :nohlsearch<CR><Esc>

 " ["+y]でクリップボードにコピー
 set clipboard=unnamed,autoselect


 """ Plugin settings """
 
 " NERDTree settings
 " 隠しファイルをデフォルトで表示させる
 let g:NERDTreeShowHidden = 1
 " ブックマークを最初から表示
 let g:NERDTreeShowBookmarks=1
 " 以下のファイルは vim からは見たくない
 let NERDTreeIgnore = ['.[oa]$', '.cm[aiox]$', '.cmxa$', '.(aux|bbl|blg|dvi|log)$', '.(tgz|gz|zip)$', 'Icon' ]
 " book mark file
 let g:NERDTreeBookmarksFile=$DROPBOX . '/lib/vim/user/nerdtree-bookmarks'
 " NERDTreeでルートを変更したらchdirする
 let g:NERDTreeChDirMode = 2
 " Type <C-e> to launch
 nnoremap <silent><C-e> :NERDTreeToggle<CR>

" caw.vim settings
nmap <C-K> <Plug>(caw:hatpos:toggle)
vmap <C-K> <Plug>(caw:hatpos:toggle)
nmap <C-I> <Plug>(caw:dollarpos:toggle)
vmap <C-I> <Plug>(caw:dollarpos:toggle)

" vim-airline settings
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'bubblegum'

" tmuxline.vim settings
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : ['#{battery_percentage} #{battery_icon}', '#{cpu_percentage} #{cpu_icon}'],
      \'y'    : ['%a', '%R'],
      \'z'    : '#H',
      \'options' : {'status-justify':'left'}}
let g:tmuxline_theme = 'papercolor'

" undotree settings
nnoremap <F5> :UndotreeToggle<cr>

" vim-gitgutter settings
set updatetime=100

" previm settings
let g:previm_open_cmd = 'google-chrome'
" let g:previm_open_cmd = 'open -a Firefox'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" vim-asciidoctor settings
" What to use for HTML, default `asciidoctor`.
let g:asciidoctor_executable = 'asciidoctor'
" What extensions to use for HTML, default `[]`.
let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge']
" Path to the custom css
let g:asciidoctor_css_path = '~/docs/AsciiDocThemes'
" Custom css name to use instead of built-in
let g:asciidoctor_css = 'haba-asciidoctor.css'
" What to use for PDF, default `asciidoctor-pdf`.
let g:asciidoctor_pdf_executable = 'asciidoctor-pdf'
" What extensions to use for PDF, default `[]`.
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram']
" Path to PDF themes, default `''`.
let g:asciidoctor_pdf_themes_path = '~/docs/AsciiDocThemes'
" Path to PDF fonts, default `''`.
let g:asciidoctor_pdf_fonts_path = '~/docs/AsciiDocThemes/fonts'
" Fold sections, default `0`.
let g:asciidoctor_folding = 1
" Fold options, default `0`.
let g:asciidoctor_fold_options = 1

" vim-go settings
let g:go_fmt_command = "goimports"
" let g:go_metalinter_autosave = 1

" deoplete.nvim settings
let deoplete#enable_at_startup = 1

" php.vim settings
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
