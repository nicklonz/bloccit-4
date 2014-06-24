# app/models/topic.rb

class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts, dependent: :destroy

  scope :visible_to, ->(user) { user ? all : where(public: true) }
end
