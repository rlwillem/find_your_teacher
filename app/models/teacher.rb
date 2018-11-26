class Teacher < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  belongs_to :subject
  has_many :appointment
  has_many :users through: :appointments
end
