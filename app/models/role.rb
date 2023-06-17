class Role < ApplicationRecord
  belongs_to :webtest
  has_many :webtasks
  has_many :refers
end
