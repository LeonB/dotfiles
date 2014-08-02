" request current colors for visual mode:
" :hi VISUALS

augroup glowshift_colors
    autocmd!
    autocmd ColorScheme * call s:set_glowshift_colors()
augroup END

function! s:set_glowshift_colors()
    " wombat256
    if (g:colors_name == 'wombat256')
        let g:glowshi_ft_candidates_hl_ctermfg = "228"
        let g:glowshi_ft_candidates_hl_ctermbg = "64"

        let g:glowshi_ft_candidates_hl_guifg = "#ecee90"
        let g:glowshi_ft_candidates_hl_guibg = "#597418"
    endif

    " monokai
    if (g:colors_name == 'monokai')
        let g:glowshi_ft_candidates_hl_ctermfg = "NONE"
        let g:glowshi_ft_candidates_hl_ctermbg = "59"

        let g:glowshi_ft_candidates_hl_guifg = "NONE"
        let g:glowshi_ft_candidates_hl_guibg = "#403D3D"
    endif

    " wombat
    if (g:colors_name == 'wombat')
        let g:glowshi_ft_candidates_hl_ctermfg = "NONE"
        let g:glowshi_ft_candidates_hl_ctermbg = "8"

        let g:glowshi_ft_candidates_hl_guifg = "#f6f3e8"
        let g:glowshi_ft_candidates_hl_guibg = "#444444"
    endif
endfunction
