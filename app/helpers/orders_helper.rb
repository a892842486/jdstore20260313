module OrdersHelper
  def order_status_class(order)
    case order.status
    when "paid"
      "bg-green-100 text-green-700"
    when "pending"
      "bg-yellow-100 text-yellow-700"
    when "shipped"
      "bg-blue-100 text-blue-700"
    when "cancelled"
      "bg-red-100 text-red-700"
    else
      "bg-gray-100 text-gray-700"
    end
  end
end
