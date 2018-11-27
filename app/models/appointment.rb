class Appointment < ApplicationRecord
  belongs_to :teacher
  belongs_to :user
  after_create :default_values

  def default_values
    self.status = "pending" if self.status.nil?
    self.save
  end
end
