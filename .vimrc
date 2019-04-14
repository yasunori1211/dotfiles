call plug#begin('~/.vim/plugged')

 Plug 'scrooloose/nerdtree'
 Plug 'tyru/caw.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'edkolev/tmuxline.vim'
 " Plug 'shougo/neocomplete.vim'

 call plug#end()

nmap <C-K> <Plug>(caw:hatpos:toggle)
vmap <C-K> <Plug>(caw:hatpos:toggle)
nmap <C-I> <Plug>(caw:dollarpos:toggle)
vmap <C-I> <Plug>(caw:dollarpos:toggle)

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
" 自動補完および色設定
 set completeopt=menuone
 for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
   exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
   endfor
   set pumheight=10
   hi Pmenu ctermbg=black ctermfg=white guifg=#000000 guibg=#999999
   hi PmenuSel ctermbg=blue ctermfg=white
   hi PmenuSbar ctermbg=0 ctermfg=9
   hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFF))
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


"let s:hooks = neobundle#get_hooks("nerdtree")
"function! s:hooks.on_source(bundle)
    " 隠しファイルをデフォルトで表示させる
    "let g:NERDTreeShowHidden = 1
    " ブックマークを最初から表示
    "let g:NERDTreeShowBookmarks=1
    " 以下のファイルは vim からは見たくない
    "let NERDTreeIgnore = ['.[oa]$', '.cm[aiox]$', '.cmxa$', '.(aux|bbl|blg|dvi|log)$', '.(tgz|gz|zip)$', 'Icon' ]
    " book mark file
    "let g:NERDTreeBookmarksFile=$DROPBOX . '/lib/vim/user/nerdtree-bookmarks'
    " NERDTreeでルートを変更したらchdirする
    "let g:NERDTreeChDirMode = 2

   " Type <C-e> to launch
    nnoremap <silent><C-e> :NERDTreeToggle<CR>
"endfunction
"unlet s:hooks

" vim-airline settings
let g:airline_powerline_fonts = 1
set laststatus=2
" let g:airline_theme = 'bubblegum'
let g:airline_theme = 'bubblegum'

" tmuxlive.vim settings
" let g:tmuxline_preset = {
"  \'a'    : '#S',
"  \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
"  \'win'  : ['#I', '#W'],
"  \'cwin' : ['#I', '#W', '#F'],
"  \'x'    : '#(date)',
"  \'y'    : ['%R', '%a', '%Y'],
"  \'z'    : '#H'}
" let g:tmuxline_theme = 'papercolor'
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
