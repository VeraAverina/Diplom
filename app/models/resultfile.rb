class Resultfile < ApplicationRecord
  # belongs_to :result
  belongs_to :user
  belongs_to :role
  mount_uploader :namefile, NamefileUploader # Tells rails to use this uploader for this model.
  #validates :name, presence: true # Make sure the owner's name is present.
end
