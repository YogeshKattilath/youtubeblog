class Post < ActiveRecord::Base

	belongs_to :category
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true
	

	has_attached_file :image, styles: { medium: "900x500#", small: "350x200>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
