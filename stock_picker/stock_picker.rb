prices = [17,3,6,9,15,8,6,1,10]

def stock_picker(prices)
  best_buy_day = nil
  best_sell_day = nil
  best_profit = nil

  prices.each_with_index do |buy_price, buy_index|
    prices_to_sell = prices.drop(buy_index + 1) #remaining days

    unless prices_to_sell.empty?
       p "buying at #{buy_price}, prices to check: #{prices_to_sell}"
      sell_price = prices_to_sell.max
      sell_index = prices_to_sell.index(sell_price)

      best_day_profit = prices[best_sell_day] - prices[best_buy_day] unless best_buy_day.nil?
      
      if best_buy_day.nil? || (sell_price - buy_price) > best_day_profit
        best_buy_day = buy_index
        best_sell_day = sell_index + buy_index + 1
      end
    end
  end

  p [best_buy_day, best_sell_day]
end

stock_picker(prices)