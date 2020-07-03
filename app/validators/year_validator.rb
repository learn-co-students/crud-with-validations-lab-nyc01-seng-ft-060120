class YearValidator < ActiveModel::Validator
  def validate(record)
    unless !record.released || record.release_year != nil
      record.errors[:release_year] << "Song must have a released year if it is released"
    end
  end
end