class ChangeDateColumnTypeToDate < ActiveRecord::Migration[5.1]
  def change
     change_column :posts, :date, :date
  end
end
