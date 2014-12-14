class AddSlugToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :stub, :string
  end
end
