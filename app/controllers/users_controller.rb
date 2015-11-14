class UsersController < ApplicationController
  before_action :set_all_feeds, only: [:new, :create, :edit, :update]

  before_action :authenticate_user!

  def index

  end

  def show

    @user = current_user
  end
end
