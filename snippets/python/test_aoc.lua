local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local s = ls.snippet

return {
  s(
    'test_aoc',
    fmt(
      [[
import solution
import pytest


class TestSolution:
    @pytest.mark.parametrize(
        "test_input, expected",
        [
            ({},{}),
        ],
    )
    def test_solution1(self, test_input: str, expected: int):
        assert solution.solution1(test_input) == expected

    @pytest.mark.parametrize(
        "test_input, expected",
        [
            ({}, {}),
        ],
    )
    def test_solution2(self, test_input: str, expected: int):
        assert solution.solution2(test_input) == expected
]],
      {
        i(1, 'test_input'),
        i(2, 'expected'),
        i(3, 'test_input'),
        i(4, 'expected'),
      }
    )
  ),
}
