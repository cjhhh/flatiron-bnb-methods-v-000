class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  has_many :reservations, through: :listings

  def city_openings(start_date, end_date)
    reservations.each do |r|
      if r.listing.vacant?(start_date, end_date)
        r.listing
      end
    end
  end
#working on

end
