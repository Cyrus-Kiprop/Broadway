class AddPlayIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :play, null: false, foreign_key: true
  end
end
