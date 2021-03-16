class Friend < ApplicationRecord
  belongs_to :user

  validates :name, :email, :dob, presence: true
end
