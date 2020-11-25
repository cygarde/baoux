class Survey < ApplicationRecord
  belongs_to :user
  has_many :asks
end
