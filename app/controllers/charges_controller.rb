class ChargesController < ApplicationController
  before_action ->{ authenticate_user!(force: false)}
  before_action :set_product

  def new
    @quantity = charge_params[:quantity]
    if @product.inventory.quantity < @quantity.to_i
      flash[:error] = "There is no enough inventory"
      redirect_to root_path
    else
      @amount = @product.price * @quantity.to_i
    end
  end

  def create
    # Amount in cents
    @quantity = charge_params[:quantity]
    @amount = (@product.price * @quantity.to_i) * 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    @product.inventory.quantity = 0
    @product.inventory.save!

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def charge_params
    params.require(:charge).permit(:product_id, :quantity)
  end

  def set_product
    @product = Product.find(charge_params[:product_id])
  end

end
