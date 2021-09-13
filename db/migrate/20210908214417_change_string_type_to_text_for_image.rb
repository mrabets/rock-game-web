class ChangeStringTypeToTextForImage < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :image, :text
  end
end
