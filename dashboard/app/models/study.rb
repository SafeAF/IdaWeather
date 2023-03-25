class Study < ApplicationRecord
  belongs_to :user
  has_many :graphs
end
