" Runs the tests for a project. Rather than trying to define all of the possible test commands,
" this repo provides simple variable hooks to provide commands to run tests at different scopes.
"
" This script provides the following hooks to run specs:
"
" * `TestSuite`: Run the entire test suite.
" * `TestFile`: Run the current file.
"
" When these commands are run, this script will automatically replace several values with their
" counterparts.
"
" * `$current_file`: The current test file being executed.

function! RunTests(command_variable)
  if !exists(a:command_variable)
    echo 'The ' . a:command_variable ' variable must be set to run this command.'
    return
  endif

  execute 'let l:command = ' . a:command_variable
  let l:command = substitute(l:command, '$file', expand('%'), 'g')

  split
  execute 'terminal ' . l:command
endfunction

function! TestSuite()
  call RunTests('g:test#suite_command')
endfunction

function! TestFile()
  call RunTests('g:test#file_command')
endfunction
