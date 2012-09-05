class CreateArticlesCategories < ActiveRecord::Migration
  def change
    create_table :articles_categories, :id => false do |t|
      t.references :category
      t.references :article
    end
    add_index :articles_categories, [:category_id, :article_id], :name => 'index_articles_categories'
  end
end
