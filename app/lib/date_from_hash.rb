class Date
  # http://stackoverflow.com/questions/13605598/how-to-get-a-date-from-date-select-or-select-date-in-rails
  def self.new_from_hash hash
    # Date.new hash["date(1i)"].to_i, hash["date(2i)"].to_i, hash["date(3i)"].to_i
    puts hash
    civil(*hash.sort.map(&:last).map(&:to_i))
  end
end