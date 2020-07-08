class Song < ApplicationRecord
    validates :title, presence: true
    validates :, uniqueness: { scope: :year,
        message: "should happen once per year" }
end
