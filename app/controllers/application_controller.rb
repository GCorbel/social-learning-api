class ApplicationController < ActionController::API
  include Clearance::Controller

  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
  end

  def handle_options_request
    head(:ok) if request.request_method == "OPTIONS"
  end
end
