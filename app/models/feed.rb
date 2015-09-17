class Feed < ActiveRecord::Base
  has_and_belongs_to_many :users

  def title
    "#{title}"
  end

  def to_s
    title
  end
end
