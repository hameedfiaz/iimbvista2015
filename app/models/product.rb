class Product < ActiveRecord::Base

	attr_accessible :name, :description, :user_id, :avatar

	mount_uploader :avatar, AvatarUploader

	has_many :items
end
