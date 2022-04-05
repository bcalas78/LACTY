class RemoveUserToProducts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :products, :user, foreign_key: true
  end
end
