class News < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :banner

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

end
