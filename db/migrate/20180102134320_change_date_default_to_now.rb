class ChangeDateDefaultToNow < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :date, Time.now
  end
end
