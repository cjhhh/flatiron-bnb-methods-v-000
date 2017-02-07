class Listing < ActiveRecord::Base
 #validations
 validates :address, :listing_type, :title, :description, :neighborhood_id, :price, presence: true

  after_save :host_status_change
  before_destroy :host_status_false

  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations

  private

  def host_status_change
    host_1 = User.find(host_id)
    host_1.update_column(:host, "true")
  end

  def host_status_false
    host1 = User.find(host_id)
     if host1.listings.count <= 1
      host1.update_column(:host, "false")
     end
  end

  # def average_review_rating
  #
  #
  # end




end
