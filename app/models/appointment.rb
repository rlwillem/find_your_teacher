class Appointment < ApplicationRecord
  belongs_to :teacher
  belongs_to :user
  after_create :default_values
  validates :rating, :inclusion => -1..5

  def default_values
    self.status = "pending" if self.status.nil?
    self.save
  end
end
