"vim configure
syntax on

set encoding=utf-8

set number
"显示是插入模式还是命令模式
set showmode
"显示键入命令
set showcmd
"支持鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"使用256色
set t_Co=256
"文件类型检测
filetype indent on
filetype plugin indent on
"自动缩进
set autoindent
"tab设置长度为4个空格
set tabstop=4
"tab自动转化4个空格
set expandtab
"光标所在行高亮
set cursorline
"自动折行
set wrap
"set nowrap
set linebreak
"显示状态栏 0 不显示 1多窗口显示 2显示
set laststatus=1
"显示光标行列
set  ruler
"自动高亮对称标点符号
set showmatch
"搜索词高亮
set hlsearch
"搜索时，每输入一个字符就跳转到响应字符
set incsearch
"搜索词只含有一个大写，匹配大小写;其他忽略大小写
set smartcase
"不创建崩溃缓存文件
set noswapfile
"编辑操作记录
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
"set undodir=~/.vim/.undo//
"set history=1000
"出错时提醒
"set visualbell
"本文件监视是否被其他读写
set autoread
"显示行尾空格tab
set listchars=tab:»■,trail:■
set list
"命令行模式下自动补全
set wildmenu
set wildmode=longest:list,full
"设置自动缩进长度为4空格
set shiftwidth=4
"粘贴
set paste
"vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
