class Responseright < ApplicationRecord
  belongs_to :itemtest

  def responses
    itemtest.responses
  end

  def responsetype_id
    itemtest.responsetype.id
  end
end
