BatmanTodo::Application.routes.draw do

  get "(*redirect_path)", to: "batman#index", constraints: lambda { |request| request.format == "text/html" }

  root to: 'application#index'

  resources :todos do
    member do
      put 'complete'
    end
  end
end
