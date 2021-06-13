
class Api::BookingsController < ApplicationController
  
  # create guest and reservation
  def create
    assign_params
    if @param.present?
      @guest = Guest.find_or_initialize_by(email: @email)
      if @guest.present? || @guest.new_record?
        if @guest.update(@guest_params)
          @reservation = @guest.reservation.new(@reservation_params)
          if @reservation.save
           render json: { status: :ok }
          else
           render json: { errors: @reservation.errors }
          end
        else
          render json: { errors: @guest.errors}
        end
      end
    else
      render json: {errors: "Invalid params"}
    end
  end

  def assign_params
    @param = true
    if params.has_key?(:reservation)
      @guest_params = reservation_params_gusts
      @reservation_params = reservation_params_reservation
    elsif params.has_key?(:guest)
      @reservation_params = reservation_params
      @guest_params = guest_params
    else
      @param = false
    end
  end
    
  def reservation_params
    @reservation_params = Reservation.booking_req_type_one(params)
  end

  def guest_params
    @email = params[:guest][:email]
    @guest_params = Guest.booking_req_type_one(params)
  end

  def reservation_params_reservation
    @reservation_params = Reservation.booking_req_type_two(params)
  end
  
  def reservation_params_gusts
    @email = params[:reservation][:guest_email]
    @guest_params = Guest.booking_req_type_two(params)
  end

end
