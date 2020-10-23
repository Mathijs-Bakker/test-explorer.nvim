if exists('g:testexplorer_Loaded') | finish | endif

" Compatible option: {{{
    let s:save_cpo = &cpo 
    set cpo&vim
    
    command! ExecuteDirTreeIterator lua require'testfile_discovery'.test()
    command! Foo lua require'current_test_framework'.test()

    let &cpo = s:save_cpo
    unlet s:save_cpo

    let g:testexplorer = 1
" }}}

" Key Mappings  {{{
"    nmap <silent> <Space>t :RunTest<CR>
"    nmap <Space>t :ExecuteDirTreeIterator<CR>
    nmap <Space>t :Foo<CR>

" }}}
