class Town < ApplicationRecord
  belongs_to :county

  validates :name, presence: true
end
