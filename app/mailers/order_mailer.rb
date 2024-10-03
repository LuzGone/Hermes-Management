class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_updated_notification.subject
  #
  def order_updated_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def order_updated_notification(order)
    @order = order
    mail(to: @order.email, subject: 'Seu Pedido foi Atualizado')
  end

end
