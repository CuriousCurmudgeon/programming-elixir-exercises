defmodule MyStrings do
    # Exercise: StringsAndBinaries-1
    def ascii?([]), do: true
    def ascii?([ head | tail ]) when head in 32..126, do: ascii?(tail)
    def ascii?(_), do: false

    # Exercise: StringsAndBinaries-2
    def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

    # Exercise: StringsAndBinaries-4
    # This breaks down to number [+-*/] number.
    # So, start by reusing number, except the terminal case is space.
    # Then, look for an operator
    # Then another space
    # Then another number.

    def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
    def number([ ?+ | tail ]), do: _number_digits(tail, 0)
    def number(str),           do: _number_digits(str, 0)

    defp _number_digits([], value), do: value
    defp _number_digits([ digit | tail ], value)
    when digit in '0123456789' do
        _number_digits(tail, value * 10 + digit - ?0)
    end
    defp _number_digits([ non_digit | _ ], _) do
        raise "Invalid digit '#{[non_digit]}'"
    end
end