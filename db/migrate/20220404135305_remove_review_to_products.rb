class RemoveReviewToProducts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :products, :review, foreign_key: true
  end
end
