class Preference < ActiveRecord::Base
  belongs_to :user

  # prevents preference table to create duplicates
  validates :user_id, uniqueness: true
end
