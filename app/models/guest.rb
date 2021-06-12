class Guest < ApplicationRecord
  has_many :reservation
  serialize :phone, Array
  VALID_EMAIL_REGEX = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/
  validate :format_email

  # Email validation
  def format_email
    errors.add('email', 'is invalid format') unless email =~ Guest::VALID_EMAIL_REGEX
  end

  def self.custom_params(params)
    {first_name: params[:guest][:first_name], last_name: params[:guest][:last_name], phone: [params[:guest][:phone]]}
  end

   def self.custom_params_two(params)
    {first_name: params[:reservation][:guest_first_name], last_name: params[:reservation][:guest_last_name], phone: params[:reservation][:guest_phone_numbers]}
  end
end
