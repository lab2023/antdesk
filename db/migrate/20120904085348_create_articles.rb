class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :body
      t.text :rendered_body
      t.boolean :status

      t.timestamps
    end
  end
end
