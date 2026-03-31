class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists

    mail(
      to: @user.email,
      subject: "[JDstore] 訂單成立通知 - #{order.token}"
    )
  end
end
