class Viewing < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  before_save :nil_if_blank

  #All possible values for rating
  def self.rating_range
    (1..5).to_a 
  end

  validates :rating, numericality: { only_integer: true }, inclusion: { in: self.rating_range }, allow_nil: true

  def render_comments
    Redcarpet::Markdown.new.render comments
  end

  private
  # http://stackoverflow.com/questions/1183506/make-blank-params-nil
  def nil_if_blank
    %w( date format comments rating ).each { |attr| self[attr] = nil if self[attr].blank? }
  end

  # Todo add watched_with and recommended_by
end
