class Project < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :tasks
  has_many :reviews
end
