if exists('g:testexplorer_Loaded') | finish | endif

" Compatible option: {{{
    let s:save_cpo = &cpo 
    set cpo&vim
    
    "command! RunTest lua require'testexplorer'.run_tests()
    command! RunTest lua require'wip'.runtest()
    command! ExecuteDirTreeIterator lua require'testfile_discovery'.test()

    let &cpo = s:save_cpo
    unlet s:save_cpo

    let g:testexplorer = 1
" }}}

" Key Mappings  {{{
    nmap <silent> <Space>t :RunTest<CR>
    nmap <Space>t :ExecuteDirTreeIterator<CR>
" }}}
