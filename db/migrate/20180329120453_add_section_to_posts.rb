class AddSectionToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :section, :string
  end
end
