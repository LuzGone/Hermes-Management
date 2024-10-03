class EmailJob
  include Sidekiq::Job

  def perform(order_id)
    order = Order.find(order_id)
    puts "Eviando notificação para o email [#{order.email}]... O seu pedido teve o status atualizado para #{order.status_pedido}"
    #OrderMailer.with(order: order).order_updated_notification.deliver_later
  end
end
