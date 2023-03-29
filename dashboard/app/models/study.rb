class Study < ApplicationRecord
  belongs_to :user
  has_many :graphs, dependent: :destroy
end
