Rails.application.routes.draw do
  root to: 'rooms#show'
  get  'admin', to: 'rooms#admin'
  mount ActionCable.server => '/cable'
end
