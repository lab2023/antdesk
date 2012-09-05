class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :application
      t.string :name
      t.string :icon_name

      t.timestamps
    end
    add_index :categories, [:application_id]
  end
end
