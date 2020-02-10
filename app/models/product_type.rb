class ProductType < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :products, dependent: :destroy
  has_one_attached :image
  before_save :proceed_templates

  def questions_left_template
    '
    <div class="button-modal ask-question" data-target="callback">
      <p>Остались вопросы?</p>
      <p>Закажите бесплатную консультацию нашего специалиста!</p>
     </div>
    '
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def proceed_templates
    self.additional_text.gsub!('[questions-left]', questions_left_template)
    self.description.gsub!('[questions-left]', questions_left_template)
  end

end
