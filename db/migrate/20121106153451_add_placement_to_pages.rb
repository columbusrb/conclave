class AddPlacementToPages < ActiveRecord::Migration
  def change
    add_column :pages, :placement, :string
    add_index :pages, :placement
  end
end
