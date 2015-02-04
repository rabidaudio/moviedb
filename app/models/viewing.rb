class Viewing < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  # Todo add watched_with and recommended_by
end
