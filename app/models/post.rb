class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :user_id, presence: true
    validates :image, presence: true,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }
    
    has_attached_file :image, styles: { :medium => "640x" }

    
end
