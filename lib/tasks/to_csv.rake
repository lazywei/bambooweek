desc "Export orders to csv."
task :to_csv => :environment do
  CSV.open('orders.csv', 'wb') do |csv|
    items = Item.all.map {|item| "#{item.name}, #{item.price}"}
    csv << ["姓名", "電話", "領預購日期(5/15 or 5/16)", "信箱"] + items + ["總價", "備註"]
    Order.all.each do |order|
      each_data = [order.name, order.mobile, order.draw_date]
      Item.select(:id).all.each do |item|
        detail = OrderItemship.where(:order_id => order.id, :item_id => item.id)
        if detail.empty?
          each_data += [0]
        else
          each_data += [1]
        end
      end
      each_data += [order.note]
      csv << each_data
    end
  end
end
