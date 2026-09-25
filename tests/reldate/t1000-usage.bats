#!/usr/bin/env bats

load fixture

@test "invalid option prints message and usage instructions" {
    run -2 reldate --invalid-option
    assert_line -n 0 'Unknown option: invalid-option'
    assert_line -n 1 'Usage:'
}

@test "-h prints long usage help" {
    run -0 reldate -h
    assert_line -n 0 'Usage:'
}

@test "--man prints full documentation manual" {
    run -0 reldate --man
    assert_line -n 0 'NAME'
    assert_line -n 2 'SYNOPSIS'
}
