class AddColumnsToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :preview_url, :string
    add_column :songs, :external_url, :string
    add_column :songs, :artist, :string
    add_column :songs, :images, :string
  end
end
