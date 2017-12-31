class RenameTypeToKind < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :type, :kind
  end
end
