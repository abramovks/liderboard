Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do 
      get 'create_key', to: 'keys#create'   
      get 'liderboard', to: 'records#index' 
      post 'liderboard', to: 'records#create'  
    end
  end


end
