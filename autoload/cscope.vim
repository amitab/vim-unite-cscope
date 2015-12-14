let s:save_cpo = &cpo
set cpo&vim

function! cscope#execute_command(cmd)
  let response = system(a:cmd)
  return response
endfunction

function! cscope#process_data(query)
  let data = cscope#execute_command(a:query)

  let results = []

  for i in split(data, '\n')
    call add(results, cscope#line_parse(i))
  endfor

  return results
endfunction

function! cscope#c_symbol(keyword)
  let query = "cscope -d -L0 " . shellescape(a:keyword)
  return cscope#process_data(query)
endfunction

function! cscope#global_definition(keyword)
  let query = "cscope -d -L1 " . shellescape(a:keyword)
  return cscope#process_data(query)
endfunction

function! cscope#line_parse(line)
  let details = split(a:line)
  return {
\    "line": a:line,
\    "file_name": details[0],
\    "function_name": details[1],
\    "line_number": str2nr(details[2], 10),
\    "code_line": join(details[3:])
\  }
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
