# ChargesController
class ChargesController < ApplicationController
  # Amount in cents
  order = Order.find(params[:order_id])

  (params[:amount].to_f.round(2) * 100).to_i
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => (params[:amount].to_f.round(2) * 100).to_i,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
  flash[:success] = "Thanks, you paid $ #{params[:amount]}"
  order.update(status: "Done")

  redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.messagfe
    redirect_to charges_path
  end
end
