# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  topic_id   :integer
#  imagepost  :string
#

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  mount_uploader :imagepost, ImagePostUploader

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60*60*24)
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end
  
  default_scope {order('rank DESC')}

  validates :title, length:{minimum: 5}, presence: true
  validates :body, length:{minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true


  def create_vote
    user.votes.create(value: 1, post: self)
  end
  
  def save_with_initial_vote
    Post.transaction do
      save
      self.create_vote
    end
  end

end
