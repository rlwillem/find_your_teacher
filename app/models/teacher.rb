class Teacher < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  belongs_to :subject
  belongs_to :user
  has_many :appointments
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :picture, presence: true
  # has_many :users through: :appointments
end
