defmodule Username do
  def sanitize([]), do: []

  def sanitize([character | rest]) do
    case character do
      ?_ -> [?_ | sanitize(rest)]
      ?ä -> [?a | [?e | sanitize(rest)]]
      ?ö -> [?o | [?e | sanitize(rest)]]
      ?ü -> [?u | [?e | sanitize(rest)]]
      ?ß -> [?s | [?s | sanitize(rest)]]
      char when char >= ?a and char <= ?z -> [char | sanitize(rest)]
      _ -> sanitize(rest)
    end
  end
end
