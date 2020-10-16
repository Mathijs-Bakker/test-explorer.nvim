if exists('g:dottestchili_Loaded') | finish | endif

" Compatible option: {{{
    let s:save_cpo = &cpo 
    set cpo&vim
    
    "command! RunTest lua require'dottestchili'.run_tests()
    command! RunTest lua require'wip'.runtest()

    let &cpo = s:save_cpo
    unlet s:save_cpo

    let g:dottestchili_Loaded = 1
" }}}

" Key Mappings  {{{
    nmap <silent> <Space>t :RunTest<CR>
" }}}
