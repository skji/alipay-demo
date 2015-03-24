Rails.application.routes.draw do
  root 'home#index'

  namespace :service do
    resource :create_partner_trade_by_buyer, only: [:show, :new, :create] do
      member do
        post :notify
      end
    end
  end
end
