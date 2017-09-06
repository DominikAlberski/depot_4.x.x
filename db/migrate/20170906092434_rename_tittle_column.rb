class RenametitleColumn < ActiveRecord::Migration
  def change
    rename_column :products, :title, :title
  end
end
