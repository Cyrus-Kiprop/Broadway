class Play < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :category
  has_one_attached :photo
end
