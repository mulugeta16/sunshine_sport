class Blog < ApplicationRecord
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  mount_uploader :image, PictureUploader
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
