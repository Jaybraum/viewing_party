class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :host, index: true, foreign_key: {to_table: :users}
      t.integer :movie_id
      t.date :event_date
      t.time :event_time
      t.integer :duration

      t.timestamps
    end
  end
end
