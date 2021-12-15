class CreateShortUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :short_urls do |t|
      t.string :code, null: false
      t.text :long_url, null: false
      t.string :shortened_url, null: false
      t.integer :hits, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end

    add_index :short_urls, :code, unique: true
  end
end
