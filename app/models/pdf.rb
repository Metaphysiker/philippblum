class Pdf < ApplicationRecord
  attr_reader :pdf_remote_url

  has_attached_file :file
  validates_attachment :file, presence: true, content_type: { content_type: "application/pdf" }


  def pdf_remote_url=(url_value)
    self.file = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # avatar_file_name == "face.png"
    # avatar_content_type == "image/png"
    @pdf_remote_url = url_value
  end

end
