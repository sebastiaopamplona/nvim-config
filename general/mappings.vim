" Save
nnoremap <c-s> :wq<CR>
nnoremap ß :w<CR>

" Because my brain inverts a command with SHIFT
nnoremap <s-w> b

" Delete a char and insert 
nnoremap X xi

nnoremap <c-k> 3k
nnoremap <c-j> 3j

vnoremap <c-k> 3k
vnoremap <c-j> 3j

" Select in normal mode
nnoremap H <esc>vh
nnoremap J <esc>vj
nnoremap K <esc>vk
nnoremap L <esc>vl

" Higlight current word
nnoremap B *N

" Clear higlight
nnoremap ≠ :noh<CR>

" Switch between buffers
nnoremap T :tabnew .<CR>
nnoremap <leader>t :tabclose<CR>

" Save
nnoremap <c-s> <esc>:wq<CR>
nnoremap ß <esc>:w<CR>

" Find with F
nnoremap F /\c
nnoremap ƒ /

" Making d and c not copy
"nnoremap d "_d
"nnoremap c "_c
"nnoremap C "_C
nnoremap X dd

" Buffer ops
nnoremap <leader>w :bd<CR>

" Back and forward
nnoremap æ <c-o>
nnoremap ø <c-i>

" Folf and unfold
nnoremap <c-i> zc
nnoremap <c-o> zo
"
" Save
inoremap <c-s> <esc>:wq<CR>
inoremap ß <esc>:w<CR>

" Damn you ESC
inoremap kj <esc>
inoremap jk <esc>

" Auto close
"inoremap { {}<left>
"inoremap ( ()<left>


" Keep selection started in normal mode
vnoremap H h
vnoremap J jzz
vnoremap K kzz
vnoremap L l
vnoremap W b

vnoremap j jzz
vnoremap k kzz

" Testing no copy with d
"vnoremap d "_d

" Use tab for identation
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Max h j k l
"noremap <leader>h 0
"noremap <leader>j G
"noremap <leader>k gg
"noremap <leader>l $

" `alt` weird characters to bing to CMD (⌘)
" [x] ¶ (alt-7)
" [x] • (alt-8)
" [x] ª (alt-9)
" [x] º (alt-0)
" [x] ≠ (alt-=)
" [x] ¥ (?????)
" [x] ˚ (alt-k) iterm2 arrow up
" [x] ∆ (alt-j) iterm2 arrow down
" [x] ˙ (alt-h) iterm2 arrow left
" [x] ¬ (alt-l) iterm2 arrow right
" [x] ß (alt-:) ⌘-s
" [x] … (alt-:) iterm2 cmd shift c
" [x] æ (alt-') itemr2 cmd [
" [x] ø (alt-o) itemr2 cmd ]
" [ ] π (alt-p)

