class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :value
      t.integer :mp3_id

      t.timestamps
    end
    add_index :ratings, :mp3_id
  end

  def self.down
    drop_table :ratings
  end
end
