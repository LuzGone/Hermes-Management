# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_updated_notification
  def order_updated_notification
    OrderMailer.order_updated_notification
  end

end
