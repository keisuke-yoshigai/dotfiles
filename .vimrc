" プラグインセットアップ
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tomasr/molokai')
  call dein#add('fatih/vim-go')
  call dein#add('zchee/deoplete-go')
  call dein#add('scrooloose/nerdtree')


  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on


" 基本
colorscheme molokai " カラースキーム
syntax on
set number " 行番号を表示
set noswapfile " スワップファイルを作らない(.swp)
set nobackup " バックアップファイルを作らない(.~)
set autoread " 編集中のファイルが変更されたら自動読み込み
set cursorline " 現在の行を強調表示
set showmatch " 括弧の対応関係を一瞬表示する


" 検索
set hlsearch " 検索結果をハイライト
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set ignorecase " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する


" タブ・スペース・インデント
set wrapscan " 検索時に最後まで行ったら最初に戻る
set expandtab " タブを半角スペースに変換する
set tabstop=4 " 行頭以外のTab文字の表示幅（スペースいくつ分）
set shiftwidth=4 " 行頭でのTab文字の表示幅
set autoindent " インデントを自動で行う
set smartindent " C言語風のインデントを自動で行う


" キーマッピング
nnoremap <Esc><Esc> :set hlsearch!<CR><Esc>
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

nnoremap <C-e> :e!<CR>


" 補完
set wildmenu " コマンドモードの補完
set history=5000
" 片方の括弧でもう片方の括弧も補完
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

" カーソル
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる


" クリップボード
set clipboard=unnamed,autoselect " クリップボードとの連携
" クリップボードからのペーストでズレが起きないようにする設定。詳細はよくわからん。
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


" その他
set nocompatible " vi互換モードで方向キーを押してアルファベットが入力されるのを防ぐ
set backspace=indent,eol,start " 改行後、バックスペースが効かない問題を解決
let g:go_fmt_command = "goimports" " goファイルの自動保存時にgoimportsコマンドを実行
