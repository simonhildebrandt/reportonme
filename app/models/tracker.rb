class Tracker < ActiveRecord::Base
  belongs_to :user
  has_many :datapoints, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }

  def total
    datapoints.collect(&:value).sum
  end

  def as_json options={}
    super(options.merge(methods: :total))
  end
end
