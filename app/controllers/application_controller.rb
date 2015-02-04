class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def render_error error_type
    error = Moviedb::Application.config.errors[error_type.to_s]
    error["method"] = request.path
    render json: {error: error}, status: error["status"]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end



# <div id="user_nav">
#   <% if current_user %>
#     Signed in as <strong><%= current_user.name %></strong>!
#     <%= link_to "Sign out", signout_path, id: "sign_out" %>
#   <% else %>
#     <%= link_to "Sign in with Facebook", "/auth/facebook", id: "sign_in" %>
#   <% end %>
# </div>