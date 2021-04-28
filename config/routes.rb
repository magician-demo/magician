Rails.application.routes.draw do
  resources :events do 
    get :register
    get :pay
    post :confirm
  end

  resources :users do
    collection do
      get :sign_in
      post :sign_in, action: 'sign_in_verify'
      delete :sign_out, action: 'destroy'
    end 
  end
end
