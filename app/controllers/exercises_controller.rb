class ExercisesController < ApplicationController
  def exercise1
    # 【要件】注文されていないすべての料理を返すこと
    #   * left_outer_joinsを使うこと
    @foods = Food.left_outer_joins(:order_foods)
  end

  def exercise2
    # 【要件】注文されていない料理を提供しているすべてのお店を返すこと
    #   * left_outer_joinsを使うこと
    @shops = Shop.left_outer_joins(:foods)
  end

  def exercise3 
    # 【要件】配達先の一番多い住所を返すこと
    #   * joinsを使うこと
    #   * 取得したAddressのインスタンスにorders_countと呼びかけると注文の数を返すこと
    @address = Address.joins(:orders).group("postalcode").order("count_all DESC").count
    @address.first[0]
    def orders_count
      self.first[1]
    end
    @address.orders_count
  end

  def exercise4 
    # 【要件】一番お金を使っている顧客を返すこと
    #   * joinsを使うこと
    #   * 取得したCustomerのインスタンスにfoods_price_sumと呼びかけると合計金額を返すこと
    @customer = Customer.joins(:orders).group("customers.name").order("count_all DESC").count.first[0]
    def foods_price_sum
      Customer.joins(orders: :foods).group("customers.name").sum("foods.price")
    end
    @customer.foods_price_sum
  end
end
