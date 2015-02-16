class Tracker < ActiveRecord::Base
  belongs_to :user
  has_many :datapoints

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
