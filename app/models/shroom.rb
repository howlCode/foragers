class Shroom < ApplicationRecord
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "cooking.jpeg"
    validates :name, :description, :edible, :image, presence: true
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
