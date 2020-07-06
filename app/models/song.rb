class Song < ApplicationRecord

    validates :title, presence: true, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year, only_integer: true }, if: :released?
    validates :artist_name, presence: true

    def released?
        if self.released == true
            return true
        else
            return false
        end
    end

end
