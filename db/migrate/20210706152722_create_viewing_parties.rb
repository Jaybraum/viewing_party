class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.references :host, index: true, foreign_key: {to_table: :users}
      t.integer :movie_id
      t.date :event_date_time
      t.integer :duration

      t.timestamps
    end
  end
end
