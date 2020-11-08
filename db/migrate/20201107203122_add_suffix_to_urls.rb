class AddSuffixToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :suffix, :string
  end
end
