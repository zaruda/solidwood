class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    path: '/pictures/:id/:style_:basename.:extension',
                    s3_host_alias: ENV['AWS_CLOUDFRONT'],
                    url: ':s3_alias_url',
                    styles: { content: '800>', thumb: '118x100#' }

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 2.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:content)
  end
end
