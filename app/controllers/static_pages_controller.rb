class StaticPagesController < ApplicationController
  def home
    redirect_to feeds_path(current_user) if signed_in?
  end

  def about
  end
end
