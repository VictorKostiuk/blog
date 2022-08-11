class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category
  belongs_to :user

  validates :title, :summary, :body, presence: true

  STATUSES = [:published, :for_processing]

  scope :published, -> { where(status: "published") }
  scope :for_processing, -> { where(status: 'for_processing') }

  after_create :count_posts

def all_tags
  self.tags.map(&:name).join(', ')
end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
     end
  end

  private

  def count_posts
    user.update_attribute(:posts_count, user.posts.count)
  end
 end