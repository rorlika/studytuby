class CreateBearers < ActiveRecord::Migration[6.1]
  def change
    create_table :bearers do |t|
      t.string :name

      t.timestamps
    end

    add_index :bearers, :name, unique: true
  end
end
