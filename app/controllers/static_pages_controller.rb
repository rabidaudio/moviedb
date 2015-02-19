class StaticPagesController < ApplicationController
  def home
  end

  def privacy
  end

  def about
  end

  def title
    (params[:action] || super).capitalize
  end
end