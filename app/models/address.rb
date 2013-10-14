class Address < ActiveRecord::Base

  belongs_to :user
  has_many :orders

  canadian_postal_code = /[a-zA-Z]\d[a-zA-Z]()\d[a-zA-Z]\d/
  # /\\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\\z/
  # /[a-zA-Z]\d[a-zA-Z]()\d[a-zA-Z]\d/
  validates :postalcode, format: { with: canadian_postal_code }
  validates :postalcode, length: { is: 6 }
  validates :province, length: { is: 2 }
  validates_presence_of :line1, :line2, :city, :province, :postalcode

  def to_s
    [ line1, line2, "#{city}, #{province}, #{postalcode}"].compact.join(", ")
  end
end

