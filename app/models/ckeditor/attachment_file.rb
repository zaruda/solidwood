class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    path: '/attachments/:id/:filename',
                    s3_host_alias: ENV['AWS_CLOUDFRONT'],
                    url: ':s3_alias_url'

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 100.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
