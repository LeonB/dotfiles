augroup ansible_yaml
  autocmd!
  au BufRead playbook.yml,roles/*yml,ansible*yml call SetAnsibleOpts()
augroup END

function SetAnsibleOpts()
   syntax match yamlInterpolate '$\w\+\|{{[^}]\+}}'
   syntax match yamlInterpolate '$\w\+\|{{[^}]\+}}' contained containedin=yamlString
   syntax match yamlConstant '\(with_items\|when\|name\|notify\|ignore_errors\|changed_when\|register\|with_password\):'
endfunction
