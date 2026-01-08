defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &is_nil(&1.price))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      %{
        item
        | name: String.replace(item.name, old_word, new_word)
      }
    end)
  end

  def increase_quantity(item, count) do
    %{
      item
      | quantity_by_size:
          Map.new(item.quantity_by_size, fn {key, value} ->
            {key, value + count}
          end)
    }
  end

  def total_quantity(%{quantity_by_size: qty}) do
    Enum.reduce(qty, 0, fn {_, value}, acc ->
      value + acc
    end)
  end
end
