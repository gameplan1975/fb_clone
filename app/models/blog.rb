class Blog < ApplicationRecord
    mount_uploader :blog_image, ImageUploader
end
