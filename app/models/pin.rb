# a pin belongs to a user
class Pin < ActiveRecord::Base
     belongs_to :user
     has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

     validates :image, presence: true
     validates :description, presence: true
end

# a user has many pins


class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
end
