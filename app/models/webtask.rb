class Webtask < ApplicationRecord
  belongs_to :role
  has_many :paragraphtests
end
