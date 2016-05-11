module Hapy::API
  class Base < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'

    mount Hapy::API::V1::Base
  end
end
