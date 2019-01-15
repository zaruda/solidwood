class News < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  enum news_type: %w(Акция Новость)

  has_one_attached :banner



  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  default_scope { order(created_at: :desc) }

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

end
