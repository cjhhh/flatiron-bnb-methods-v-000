class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"

  has_one :review

  validates :checkin, :checkout, presence: true
  # validate :no_reserve_on_own_listing, :reserved
  #
  #
  #   def reserved
  #     Reservation.where(:listing_id => listing.id).each do |r|
  #       reserved_days = r.checkin..r.checkout
  #      if reserved_days === checkin || reserved_days === checkout
  #        errors.add(:guest_id, "Sorry this has been reserved already.")
  #      end
  #     end
  #   end
  #
  #   def no_reserve_on_own_listing
  #     listing = Listing.find(listing_id)
  #     host = User.find(listing.host_id)
  #     if host.id == self.guest_id
  #       errors.add(:guest_id, "can't be a guest where you host")
  #     end
  #   end


end
