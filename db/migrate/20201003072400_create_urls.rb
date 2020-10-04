class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :number_of_visits, :default => 0
      t.string :ip_address

      t.timestamps
    end
  end
end
