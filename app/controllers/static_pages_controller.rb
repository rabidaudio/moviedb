class StaticPagesController < ApplicationController
  def home
  end

  def privacy
  end

  def title
    (params[:action] || super).capitalize
  end
end