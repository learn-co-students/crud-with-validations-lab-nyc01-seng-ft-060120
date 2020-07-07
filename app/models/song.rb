class Song < ApplicationRecord
  validates :title, presence: true, allow_blank: false, allow_nil: false, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates_presence_of :genre, :artist_name, :artist_name

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released
  end



end
