class Teacher < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  belongs_to :subject
  belongs_to :user
  has_many :appointments
  # has_many :users through: :appointments
end
