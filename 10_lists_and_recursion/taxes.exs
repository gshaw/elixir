# Exercise ListsAndRecursion-8
defmodule Taxes do
  def test do
    tax_rates = [ NC: 0.075, TX: 0.08 ]

    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount:  50.00 ]
    ]

    orders_with_taxes(orders, tax_rates)
  end

  def total_amount(order, tax_rates) do
    tax_rate = Keyword.get(tax_rates, order[:ship_to], 0)
    order[:net_amount] * (1 + tax_rate)
  end

  def orders_with_taxes(orders, tax_rates) do
    for order <- orders do
      order ++ [total_amount: total_amount(order, tax_rates)]
    end
  end
end
