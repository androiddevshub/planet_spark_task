class CreateShortUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :shorten_url
      t.integer :clicked, default: 0
      t.timestamps
    end
  end
end
