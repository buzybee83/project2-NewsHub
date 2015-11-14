class UserFeedsController < ApplicationController
  before_action :set_current_user


  def index
  end

  def show

  end

  def edit
    @all_feeds = Feed.all
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to feeds_path, notice: 'Sources were successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:feed_ids => [])
  end
end
