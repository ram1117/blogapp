class RemoveDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :posts_counter, nil
  end
end
