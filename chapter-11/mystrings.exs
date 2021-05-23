defmodule MyStrings do
    # Exercise: StringsAndBinaries-1
    def ascii?([]), do: true
    def ascii?([ head | tail ]) when head in 32..126, do: ascii?(tail)
    def ascii?(_), do: false

    # Exercise: StringsAndBinaries-2
    def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

    # Exercise: StringsAndBinaries-4
    # This is much easier if you split the string, so
    # I implemented split for single-quoted strings.
    def calculate(str) do
        [ first_number, operator, second_number ] = split str, ' '
        _calculate number(first_number), operator, number(second_number)
    end
    defp _calculate(first_number, '+', second_number), do: first_number + second_number
    defp _calculate(first_number, '-', second_number), do: first_number - second_number
    defp _calculate(first_number, '*', second_number), do: first_number * second_number
    defp _calculate(first_number, '/', second_number), do: first_number / second_number


    def number(str),           do: _number_digits(str, 0)

    defp _number_digits([], value), do: value
    defp _number_digits([ 32 | tail], value), do: { value, tail }
    defp _number_digits([ digit | tail ], value)
    when digit in '0123456789' do
        _number_digits(tail, value * 10 + digit - ?0)
    end
    defp _number_digits([ digit | tail ], value)
    when digit in '0123456789' do
        _number_digits(tail, value * 10 + digit - ?0)
    end
    defp _number_digits([ non_digit | _ ], _) do
        raise "Invalid digit '#{[non_digit]}'"
    end

    # The separator must be a single-quoted string (charlist)
    # with a length of 1
    def split(list, [ separator | [] ]) when is_list(list) do
        Enum.reverse _split(list, separator, [], [])
    end

    defp _split([], _, current, result), do: [ current | result ]
    defp _split([ head | tail ], separator, current, result) when head == separator do
        _split tail, separator, [], [ current | result ]
    end
    defp _split([ head | tail ], separator, current, result) do
        _split tail, separator, current ++ [head], result
    end

    # Exercise: StringsAndBinaries-5
    def center(strings) do
        max_length = String.length(Enum.max_by strings, &(String.length &1))
        Enum.each strings, &(IO.puts _pad_to(&1, max_length))
    end
    defp _pad_to(string, length) do
        padding_length = length - String.length(string)
        right_padded = String.pad_trailing(string, length - div(padding_length, 2))
        String.pad_leading(right_padded, length)
    end

    # Exercise: StringsAndBinaries-6
    def capitalize_sentences(string) when is_binary(string) do
        capitalized_string =
            String.split(string, ". ")
            |> Enum.filter(&(String.length(&1) > 0))
            |> Enum.map_join(". ", &(String.capitalize(&1)))
        # This part feels a bit ugly to append to the end, but the preceding
        # logic feels good enough that I'm ok with it for now.
        capitalized_string <> ". "
    end
end
