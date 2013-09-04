LetUsLunch::Application.routes.draw do
  root to: "events#new"
  resources :events do
    member do
      get :confirm
    end
  end
  
  resources :invitations do
    member do
      get :accept
      get :reject
    end
  end
end