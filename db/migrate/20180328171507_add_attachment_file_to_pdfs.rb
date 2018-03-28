class AddAttachmentFileToPdfs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pdfs do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :pdfs, :file
  end
end
