class Ask < ApplicationRecord
  belongs_to :survey
  has_many :answers
end
