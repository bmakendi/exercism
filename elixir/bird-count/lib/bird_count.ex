defmodule BirdCount do
  def today([]), do: nil

  def today(list) do
    hd(list)
  end

  def increment_day_count([]), do: [1]

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _tail]), do: true

  def has_day_without_birds?([_head | tail]) do
    has_day_without_birds?(tail)
  end

  def total([], acc), do: acc
  def total([head | tail], acc), do: total(tail, head + acc)
  def total(list), do: total(list, 0)

  def busy_days([], acc), do: acc
  def busy_days([head | tail], acc) when head >= 5, do: busy_days(tail, acc + 1)
  def busy_days([_head | tail], acc), do: busy_days(tail, acc)

  def busy_days(list) do
    busy_days(list, 0)
  end
end
