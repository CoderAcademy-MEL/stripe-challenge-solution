class ChargesController < ApplicationController
  def new
  end

def create
  @course = Course.find(params[:course_id])

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @course.price,
    :description => @course.title,
    :currency    => 'aud'
  )

  current_user.courses << @course

  redirect_to @course

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
