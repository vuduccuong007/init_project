class Micropost < ApplicationRecord
  MICROPOST_PERMIT = %i(content image).freeze

  belongs_to :user
  has_one_attached :image

  delegate :name, to: :user, prefix: true

  validates :user_id, presence: true
  validates :content, presence: true,
             length: {maximum: Settings.micropost.maximum}
  validates :image, content_type: {in: Settings.micropost.type.split(" "),
                                   message: I18n.t(".valid_image")},
                    size: {less_than: Settings.micropost.size.megabytes,
                           message: I18n.t(".images_size")}

  scope :order_created_at, ->{order created_at: :desc}

  def display_image
    image.variant(resize_to_limit: [Settings.micropost.img_wh,
                                    Settings.micropost.img_wh])
  end
end
