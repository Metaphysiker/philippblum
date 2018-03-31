class Pdf < ApplicationRecord
  before_save :set_url
  attr_reader :pdf_remote_url

  has_attached_file :file
  validates_attachment :file, presence: true, content_type: { content_type: "application/pdf" }

  validates :title, presence: true, uniqueness: true

  include PgSearch
  pg_search_scope :search_title_file_name_url,
                  against: [:title, :file_file_name, :url],
                  using: {
                      :tsearch => {:prefix => true, :any_word => true}
                  }

  def pdf_remote_url=(url_value)
    self.file = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # avatar_file_name == "face.png"
    # avatar_content_type == "image/png"
    @pdf_remote_url = url_value
  end

  def set_url
    #self.update(url: URLify.urlify(self.title))
    self.url = URLify.urlify(self.title)
  end

  def is_cv?
    staticpdfs = ["CV"]

    staticpdfs.include?(self.title)

  end

end
