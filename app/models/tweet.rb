class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :team
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :image
    validates :name,   length: { maximum: 30 }
    validates :text,   length: { maximum: 191 }
    validates :team_id
  end

  def self.search(search)
    if search != ''
      Tweet.where(['text LIKE(?) OR name LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Tweet.order('created_at DESC')
    end
  end
end
