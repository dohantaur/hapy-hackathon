Rails.application.routes.draw do
  use_doorkeeper
  mount Hapy::API::Base => '/'
end
