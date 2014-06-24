# app/models/user.rb

class User < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  User.create! name: "Joe Schmoe"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  friendly_id :name, use: :slugged

  def role?(base_role)
    role == base_role.to_s
  end

  def voted( post )
    self.votes.where( post_id: post.id ).first
  end

  def favorited(post)
    self.favorites.where(post_id: post.id).first
  end
end
