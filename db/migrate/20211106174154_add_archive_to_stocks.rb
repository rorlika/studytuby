class AddArchiveToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :archive, :boolean, default: false
  end
end
