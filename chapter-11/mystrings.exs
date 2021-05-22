defmodule MyStrings do
    # Exercise: StringsAndBinaries-1
    def is_ascii?([]), do: true
    def is_ascii?([ head | tail ]) when head in 32..126, do: is_ascii(tail)
    def is_ascii?(_), do: false
end