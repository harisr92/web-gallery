class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @images = current_user.images.build
      @image = current_user.images.order(created_at: :desc)
    end
  end
end
