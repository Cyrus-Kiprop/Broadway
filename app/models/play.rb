class Play < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
