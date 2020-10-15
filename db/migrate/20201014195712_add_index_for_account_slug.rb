class AddIndexForAccountSlug < ActiveRecord::Migration[6.0]
  def change
    add_index :accounts, :slug, unique: true
  end
end
