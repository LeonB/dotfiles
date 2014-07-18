" yajl-tools
" jsonpp

func! s:compareItem(i1, i2)
    return a:i1.name == a:i2.name ? 0 : a:i1.name > a:i2.name ? 1 : -1
endfunc

func! s:getNeoBundlePath()
    return neobundle#get_neobundle_dir()
endfunc

func! s:getFile()
    let path = s:getNeoBundlePath()
    return path . '/versions.json'
endfunc

func! s:getBundles()
    return neobundle#config#get_neobundles()
endfunc

func! s:getData()
    let bundles = s:getBundles()

    let data = []
    for bundle in bundles
        let revision = neobundle#installer#get_revision_number(bundle)

        " add new dict to list
        call add(data, {
                    \ 'name': bundle.name,
                    \ 'revision': revision
                    \ })
    endfor

    let data = sort(data, 's:compareItem')
    return data
endfunc

func! s:writeJSON(data)
    let json = s:convertDataToJSON(a:data)
    let json = s:formatJSON(json)
    call writefile(split(json, "\n"), s:getFile())
endfunc

func! s:convertDataToJSON(data)
    return webapi#json#encode(a:data)
endfunc

func! s:formatJSON(json)
    " Depends on yajl-tools
    return system('echo '.shellescape(a:json).' | json_reformat')
endfunc

func! s:NeoBundleSaveVersions()
    let data = s:getData()
    call s:writeJSON(data)
endfunc

" Add command
command! NeoBundleSaveVersions call s:NeoBundleSaveVersions()
