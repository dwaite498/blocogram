class Post < ActiveRecord::Base
    validates :image, presence: true,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }
    
    has_attached_file :image, styles: { :medium => "640x" }

    
end
