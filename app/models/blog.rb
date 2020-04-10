class Blog < ApplicationRecord
    belongs_to :user
    mount_uploader :blog_image, ImageUploader
    validates :content, presence: true
end
