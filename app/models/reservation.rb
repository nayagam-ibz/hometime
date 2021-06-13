class Reservation < ApplicationRecord
  belongs_to :guest

  validates_presence_of :start_date, :end_date, :adults

  def self.booking_req_type_one(params)
    {start_date: params[:start_date], end_date:params[:end_date], nights: params[:nights], guests: params[:guests], adults: params[:adults], children: params[:children], infants:params[:infants], status: params[:status], currency: params[:currency], payout_price: params[:payout_price], security_price: params[:security_price], total_price: params[:total_price]}
  end


  def self.booking_req_type_two(params)
    {start_date: params[:reservation][:start_date], end_date: params[:reservation][:end_date], nights: params[:reservation][:nights], guests: params[:reservation][:number_of_guests], adults: params[:reservation][:guest_details][:number_of_adults], children: params[:reservation][:guest_details][:number_of_children], infants: params[:reservation][:guest_details][:number_of_infants], status: params[:reservation][:status_type], currency: params[:reservation][:host_currency],
      payout_price: params[:reservation][:expected_payout_amount], security_price: params[:reservation][:listing_security_price_accurate], total_price: params[:reservation][:total_paid_amount_accurate] }
  end
end
