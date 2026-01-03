defmodule Username do
  def sanitize([]), do: []

  def sanitize([character | rest]) do
    case character do
      char when char == ?_ -> [char | sanitize(rest)]
      char when char >= ?a and char <= ?z -> [char | sanitize(rest)]
      char when char == ?ä -> [?a | [?e | sanitize(rest)]]
      char when char == ?ö -> [?o | [?e | sanitize(rest)]]
      char when char == ?ü -> [?u | [?e | sanitize(rest)]]
      char when char == ?ß -> [?s | [?s | sanitize(rest)]]
      _ -> sanitize(rest)
    end
  end
end
