class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title, null: false
      t.string :feed_url, null: false
      t.string :favicon_url

      t.timestamps null: false
    end
  end
end
