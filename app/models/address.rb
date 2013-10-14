class Address < ActiveRecord::Base

  # before_save :uppercase_fields

  # def uppercase_fields
  #   attributes.each_value{|value| value.upcase!}
  # end

  belongs_to :user
  has_many :orders

  canadian_postal_code = /[a-zA-Z]\d[a-zA-Z]()\d[a-zA-Z]\d/
  validates :postalcode, format: { with: canadian_postal_code }
  validates :postalcode, length: { is: 6 }
  validates :province, format: {with: /[A-Z]{2}/}
  validates_presence_of :line1, :line2, :city, :province, :postalcode

  def to_s
    [ line1, line2, "#{city}, #{province}, #{postalcode}"].compact.join(", ")
  end
end

