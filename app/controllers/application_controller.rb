class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def render_error error_type
    e = Moviedb::ErrorResponse.new type: error_type, method: request.path
    render json: e.to_json, status: e.status
  end
end


module Moviedb
  class ErrorResponse

    def initialize opts
      @type = Application.config.errors[opts[:type].to_s]
      @type["method"] = opts[:method]
    end

    def status
      @type["status"]
    end

    def to_json
      @type.to_json
    end

  end
end