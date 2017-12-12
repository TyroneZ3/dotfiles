syntax on
set nu
set ruler
set showcmd
set foldenable
set nocompatible
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
set autowrite
set cursorline
set autoindent
set cindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch

"TAB替换为空格
set ts=4
set expandtab
%retab!

"字体颜色
set t_Co=256 
colorscheme industry

"设定编码  
set enc=utf-8  
set fileencodings=ucs-bom,utf-8,chinese  
set langmenu=zh_CN.UTF-8  
language message zh_CN.UTF-8  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  

"自动补全括号
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function CloseBracket()
    if match(getline(line('.') + 1), '\s*}') < 0
        return "\<CR>}"
    else
        return "\<Esc>j0f}a"
    endif
endf

function QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == ""
        return a:char
    elseif line[col - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<Esc>i"
    endif
endf

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"安装YCM
Plugin 'Valloric/YouCompleteMe'
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>  "force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>  "open locationlist
" nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>

let g:ycm_global_ycm_extra_conf = '~/.vim/data/ycm/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1  
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
" SirVer/ultisnips 代码片断
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]
"参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
"解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
"https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
" begin
" let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" end
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 





"Tagbar
Plugin 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
map <F3> :Tagbar<CR>
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"NERDTree
Plugin 'scrooloose/nerdtree'
"将F2设置为开关NERDTree的快捷键
map <f2> :NERDTreeToggle<cr>
nmap <Leader>nt :NERDTreeToggle<cr>
"修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"窗口位置
let g:NERDTreeWinPos='left'
"窗口尺寸
let g:NERDTreeSize=30
"窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
"不显示隐藏文件
let g:NERDTreeHidden=0
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"打开vim时自动打开NERDTree
autocmd vimenter * NERDTree

"vim-airline
Plugin 'bling/vim-airline'
set laststatus=2

" 浠ヤ笅鑼冧緥鐢ㄦ潵鏀寔涓嶅悓鏍煎紡鐨勬彃浠跺畨瑁?
" 璇峰皢瀹夎鎻掍欢鐨勫懡浠ゆ斁鍦╲undle#begin鍜寁undle#end涔嬮棿.
" Github涓婄殑鎻掍欢
" 鏍煎紡涓?Plugin '鐢ㄦ埛鍚?鎻掍欢浠撳簱鍚?
"Plugin 'tpope/vim-fugitive'
" 鏉ヨ嚜 http://vim-scripts.org/vim/scripts.html 鐨勬彃浠?
" Plugin '鎻掍欢鍚嶇О' 瀹為檯涓婃槸 Plugin 'vim-scripts/鎻掍欢浠撳簱鍚? 鍙槸姝ゅ鐨勭敤鎴峰悕鍙互鐪佺暐
"Plugin 'L9'
" 鐢盙it鏀寔浣嗕笉鍐峠ithub涓婄殑鎻掍欢浠撳簱 Plugin 'git clone 鍚庨潰鐨勫湴鍧€'
"Plugin 'git://git.wincent.com/command-t.git'
" 鏈湴鐨凣it浠撳簱(渚嬪鑷繁鐨勬彃浠? Plugin 'file:///+鏈湴鎻掍欢浠撳簱缁濆璺緞'
"Plugin 'file:///home/gmarik/path/to/plugin'
" 鎻掍欢鍦ㄤ粨搴撶殑瀛愮洰褰曚腑.
" 姝ｇ鎸囧畾璺緞鐢ㄤ互璁剧疆runtimepath. 浠ヤ笅鑼冧緥鎻掍欢鍦parkup/vim鐩綍涓?
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 瀹夎L9锛屽鏋滃凡缁忓畨瑁呰繃杩欎釜鎻掍欢锛屽彲鍒╃敤浠ヤ笅鏍煎紡閬垮厤鍛藉悕鍐茬獊
"Plugin 'ascenator/L9', {'name': 'newL9'}

" 浣犵殑鎵€鏈夋彃浠堕渶瑕佸湪涓嬮潰杩欒涔嬪墠
call vundle#end()            " 蹇呴』
filetype plugin indent on    " 蹇呴』 鍔犺浇vim鑷甫鍜屾彃浠剁浉搴旂殑璇硶鍜屾枃浠剁被鍨嬬浉鍏宠剼鏈?
" 蹇借鎻掍欢鏀瑰彉缂╄繘,鍙互浣跨敤浠ヤ笅鏇夸唬:
filetype plugin on
"
"Vundle命令
" :PluginList       - 鍒楀嚭鎵€鏈夊凡閰嶇疆鐨勬彃浠?
" :PluginInstall     - 瀹夎鎻掍欢,杩藉姞 `!` 鐢ㄤ互鏇存柊鎴栦娇鐢?:PluginUpdate
" :PluginSearch foo - 鎼滅储 foo ; 杩藉姞 `!` 娓呴櫎鏈湴缂撳瓨
" :PluginClean      - 娓呴櫎鏈娇鐢ㄦ彃浠?闇€瑕佺璁? 杩藉姞 `!` 鑷姩鎵瑰噯绉婚櫎鏈娇鐢ㄦ彃浠?
"
" 鏌ラ槄 :h vundle 鑾峰彇鏇村缁嗚妭鍜寃iki浠ュ強FAQ
" 灏嗕綘鑷繁瀵归潪鎻掍欢鐗囨鏀惧湪杩欒涔嬪悗

"ctags自动开启
set tags=./tags

"F5自动编译
autocmd BufReadPost *.c nmap <F5> :call Gcc()  
fu Gcc()  
exec "silent !gcc -o " . expand("%:t:r") . " %"  
exec "!./" . expand("%:t:r")  
endf

"光标停留在上次关闭时的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
