class Paragraphtest < ApplicationRecord
  belongs_to :itemtest
  belongs_to :posimage
  belongs_to :paragraphtype
  
  has_one_attached :image

  def responses
    itemtest.responses
  end

  def responsetype_id
    itemtest.responsetype.id
  end

  def to_s
    body + " [" + paragraphtype.title + "]"
  end
end
