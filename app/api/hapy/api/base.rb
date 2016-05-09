module Hapy::API
  class Base < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'

    helpers { def method; options[:method][0]; end }

    mount Hapy::API::V1::Base
  end
end
