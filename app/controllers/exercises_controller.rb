class ExercisesController < ApplicationController
  def exercise1
    # 【要件】注文されていないすべての料理を返すこと
    #   * left_outer_joinsを使うこと
    @foods = Food.left_outer_joins(:order_foods).where(order_foods: { id: nil })
  end

  def exercise2
    # 【要件】注文されていない料理を提供しているすべてのお店を返すこと
    #   * left_outer_joinsを使うこと
    @shops = Shop.left_outer_joins(foods: :order_foods).distinct.where(foods: { order_foods: { id: nil } })
  end

  def exercise3 
    # 【要件】配達先の一番多い住所を返すこと
    #   * joinsを使うこと
    #   * 取得したAddressのインスタンスにorders_countと呼びかけると注文の数を返すこと
    @address = Address.joins(:orders).select("addresses.*, count(orders.*) as orders_count").group("addresses.id").order("orders_count DESC").first
    
    @address.orders_count
  end

  def exercise4 
    # 【要件】一番お金を使っている顧客を返すこと
    #   * joinsを使うこと
    #   * 取得したCustomerのインスタンスにfoods_price_sumと呼びかけると合計金額を返すこと
    @customer = Customer.joins(orders: :foods).select("customers.*, sum(foods.price) as foods_price_sum").group("customers.id").order("foods_price_sum DESC").first
    @customer.foods_price_sum
  end
end
