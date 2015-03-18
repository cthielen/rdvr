class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.integer :show_id
      t.string :filename
      t.string :title
      t.datetime :started
      t.datetime :finished

      t.timestamps null: false
    end
  end
end
