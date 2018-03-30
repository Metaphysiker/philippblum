class Video < ApplicationRecord
  before_save :set_url

  has_attached_file :video
  validates_attachment :video, presence: true, content_type: { content_type:  ["video/mpeg", "video/quicktime", "video/vnd.vivo", "video/x-msvideo", "video/x-sgi-movie", "video/mp4"] }

  validates :title, presence: true, uniqueness: true


  def set_url
    #self.update(url: URLify.urlify(self.title))
    self.url = self.title.parameterize
  end
end
