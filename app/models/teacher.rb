class Teacher < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  belongs_to :subject
  belongs_to :user
  has_many :appointments
  validates :name, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :rate, presence: true
  # has_many :users through: :appointments

  def average_rating
    rating = 0
    number = 0
    appointments.each do |appointment|
      unless appointment.rating.nil?
        rating += appointment.rating
        number += 1
      end
    end
    rating = (rating / number).round unless rating.zero?
    return rating
  end
end
