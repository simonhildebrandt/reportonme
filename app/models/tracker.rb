class Tracker < ActiveRecord::Base
  belongs_to :user
  has_many :datapoints

  validate :name, presence: true, uniqueness: {scope: :user_id}
end
