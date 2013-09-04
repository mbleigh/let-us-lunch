class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.string :organizer_name
      t.string :organizer_email
      t.boolean :confirmed
      t.string :token
      t.string :location
      t.datetime :time
      t.text :message

      t.timestamps
    end
  end
end
