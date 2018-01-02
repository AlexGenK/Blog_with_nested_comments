class ChangeKindColumnDefaultToArticle < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :kind, 'article'
  end
end
