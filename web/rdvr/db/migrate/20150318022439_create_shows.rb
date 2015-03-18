class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :artist
      t.text :description
      t.string :genre
      t.boolean :weekly
      t.datetime :start
      t.integer :duration
      t.string :host
      t.integer :port
      t.string :url

      t.timestamps null: false
    end
  end
end
