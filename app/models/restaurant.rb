class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :phone_number, presence: true
  validates :owner, presence: true

  belongs_to :owner
end
