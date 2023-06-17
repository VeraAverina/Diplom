class Onetest < ApplicationRecord
  belongs_to :discipline
  has_many :itemtests

  accepts_nested_attributes_for :itemtests, allow_destroy: true

  def itemtest_order_next
    itemtests.size + 1
  end

  def itemtest_first
    itemtests.first
  end

end
