class FeedsController < ApplicationController
  # before_action :verify_correct_user
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  # GET /feeds
  # GET /feeds.json
  def index
    # @feeds = Feed.all
    @feeds = current_user.feeds
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    data = Feedjira::Feed.fetch_and_parse @feeds.feed_url
    # switch to check for feed url/title
    case
    when data.title == "The Verge -  All Posts"
      @feed_items = FeedData.verge(data)
    when data.title == "TechCrunch"
      @feed_items = FeedData.tech_crunch(data)
    when data.title == "Gizmodo"
       @feed_items = FeedData.gizmodo(data)
    else
     "Sorry, the source is not available"
    end
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feeds = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:title, :feed_url, :favicon_url)
    end

    # def verify_correct_user
    #   @feed = current_user.feeds.find_by(user_id: params[:id])
    #   redirect_to feeds_path if @feed.nil?
    # end
end
