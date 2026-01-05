defmodule NameBadge do
  def print(id, name, department) do
    badge =
      if id do
        "[#{id}] - #{name} - "
      else
        "#{name} - "
      end

    if department do
      badge <> String.upcase(department)
    else
      badge <> "OWNER"
    end
  end
end
