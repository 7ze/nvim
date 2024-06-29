local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local s = ls.snippet

return {
  s(
    'aoc',
    fmt(
      [[
import sys


def solution1():
    pass


def solution2():
    pass


def main() -> None:
    with open("input", "r") as f:
        {}
    try:
        n = int(sys.argv[1])
        match n:
            case 1:
                solution1()
            case 2:
                solution2()
    except (IndexError, ValueError) as e:
        print(e)


if __name__ == "__main__":
    main()
  ]],
      {
        i(1, 'pass'),
      }
    )
  ),
}
