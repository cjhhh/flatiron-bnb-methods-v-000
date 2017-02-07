class User < ActiveRecord::Base
  has_many :listings, :foreign_key => 'host_id'
  has_many :reservations, :through => :listings
  has_many :trips, :foreign_key => 'guest_id', :class_name => "Reservation"
  has_many :reviews, :foreign_key => 'guest_id'

  #g
  has_many :hosts, through: :trips, class_name: 'User',
                                       foreign_key: "host_id"
  #h
  has_many :guests, through: :reservations, class_name: 'User',
                                            foreign_key: "guest_id"





end
