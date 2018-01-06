class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :kind, default: 'article'
      t.date :date
      t.string :user

      t.timestamps
    end
  end
end
