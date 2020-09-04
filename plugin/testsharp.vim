if exists('g:TestSharp_Loaded') | finish | endif

" Compatible option: {{{
    let s:save_cpo = &cpo 
    set cpo&vim
    
    let g:testsharp_window_left = 0

    command! RunTest lua require'testsharp'.run_tests()

    let &cpo = s:save_cpo
    unlet s:save_cpo

    let g:TestSharp_Loaded = 1
" }}}

" Key Mappings  {{{
    nmap <space>t :RunTest<CR>
" }}}
