class AddSongUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :mp3s, [:title, :artist], :unique => true
  end

  def self.down
    remove_index :mp3s, [:title, :artist]
  end
end
