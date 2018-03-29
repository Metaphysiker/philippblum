class AddUrlToPdfs < ActiveRecord::Migration[5.1]
  def change
    add_column :pdfs, :url, :string
  end
end
