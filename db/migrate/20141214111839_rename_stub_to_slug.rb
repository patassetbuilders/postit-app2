class RenameStubToSlug < ActiveRecord::Migration
  def change
    rename_column :categories, :stub, :slug
  end
end
