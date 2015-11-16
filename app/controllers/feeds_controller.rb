class FeedsController < ApplicationController
  # before_action :is_correct_user?
  before_action :set_feed, only: [:show, :edit]

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
     unless is_correct_user?
       @feed_items = FeedData.verge(data)
     end
    when data.title == "TechCrunch"
      unless is_correct_user?
        @feed_items = FeedData.tech_crunch(data)
      end
    when data.title == "Gizmodo"
      unless is_correct_user?
         @feed_items = FeedData.gizmodo(data)
      end
    when data.title == "Lifehacker"
      unless is_correct_user?
         @feed_items = FeedData.lifehacker(data)
      end
    when data.title == "Engadget RSS Feed"
      unless is_correct_user?
         @feed_items = FeedData.engadget(data)
      end
    when data.title == "9to5Mac"
      unless is_correct_user?
         @feed_items = FeedData.nineto5mac(data)
      end
    when data.title == "WIRED"
      unless is_correct_user?
         @feed_items = FeedData.wired(data)
      end
    when data.title == "Re/code"
      unless is_correct_user?
         @feed_items = FeedData.recode(data)
      end
    when data.title == "ScienceAlert - Latest"
      unless is_correct_user?
         @feed_items = FeedData.science_alert(data)
      end
    when data.title == "TechNewsWorld"
      unless is_correct_user?
         @feed_items = FeedData.tech_news_world(data)
      end
    when data.title == "UrbanGeekz"
      unless is_correct_user?
         @feed_items = FeedData.urban_geekz(data)
      end
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
      if @feeds.update
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

    def is_correct_user?
      @feed = current_user.feeds.find_by(id: params[:id])
      redirect_to feeds_path, notice: "No source available" if @feed.nil?
    end
end
