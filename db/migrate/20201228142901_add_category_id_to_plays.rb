class AddCategoryIdToPlays < ActiveRecord::Migration[6.1]
  def change
    add_reference :plays, :category, index: true
  end
end
