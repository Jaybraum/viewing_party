class CreatePartyParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :party_participants do |t|
      t.references :party, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
