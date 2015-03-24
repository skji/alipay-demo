Rails.application.routes.draw do
  root 'home#index'

  namespace :service do
    resource :create_partner_trade_by_buyer, only: [:new, :create] do
      member do
        get :return
        post :notify
      end
    end
  end
end
