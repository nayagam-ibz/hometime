Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    scope module: "api" do
      post "/reservation" => "home#reservation"
    end
  end
end
