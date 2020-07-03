class Song < ApplicationRecord
  
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year]}
  include ActiveModel::Validations
  validates_with YearValidator
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year, allow_nil: true}
  
  
  
  # binding.pry
  
  
end
