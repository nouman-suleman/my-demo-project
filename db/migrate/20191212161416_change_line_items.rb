class ChangeLineItems < ActiveRecord::Migration[5.2]
  def change
    change_column :line_items, :order_id, :bigint,  :null => true
  end
end
