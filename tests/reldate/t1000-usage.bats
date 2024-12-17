#!/usr/bin/env bats

@test "invalid option prints message and usage instructions" {
    run reldate --invalid-option
    [ $status -eq 2 ]
    [ "${lines[0]}" = 'Unknown option: invalid-option' ]
    [ "${lines[1]}" = 'Usage:' ]
}

@test "-h prints long usage help" {
    run reldate -h
    [ $status -eq 0 ]
    [ "${lines[0]}" = 'Usage:' ]
}

@test "--man prints full documentation manual" {
    run reldate --man
    [ $status -eq 0 ]
    [ "${lines[0]}" = 'NAME' ]
    [ "${lines[2]}" = 'SYNOPSIS' ]
}
