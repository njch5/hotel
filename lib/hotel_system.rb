require_relative "room"
require_relative "reservation"
require_relative "date_range"
require "pry"

module Hotel
  class HotelSystem
    attr_reader :rooms, :reservations

    def initialize
      @rooms = []
      @reservations = []

      (1..20).each do |num|
        @rooms << Hotel::Room.new(id: num)
      end
    end

    def list_of_rooms
      return @rooms
    end

    def reserve_room(start_date:, end_date:, price: 200)
      id = create_id(@reservations)
      # date_range = date_range_constructor(start_date, end_date)
      date_range = Hotel::DateRange.new(start_date: start_date, end_date: end_date)
      room = available_room(date_range)
      # reservation = reservation_constructor(id, room, date_range, price)
      reservation = Hotel::Reservation.new(id: id, room: room, date_range: date_range, price: price)
      add_reservation(reservation)
      return reservation
    end

    def reservations_by_date(specific_date)
      return @reservations.select do |reservation|
               reservation.include_date?(specific_date)
             end
    end

    def open_rooms(date_range)
      return @rooms.select do |room|
               room.is_available?(date_range)
             end
    end

    def available_room(date_range)
      room = open_rooms(date_range).find { |room| room }
      raise StandardError, "No available rooms!" unless room
      return room
    end

    def add_reservation(reservation)
      @reservations << reservation
    end

    private

    def create_id(object)
      return object.count + 1
    end

    # The constructors don't have to be private methods!
    # def date_range_constructor(start_date, end_date)
    #   Hotel::DateRange.new(start_date: start_date, end_date: end_date)
    # end

    # def reservation_constructor(id, room, date_range, price)
    #   Hotel::Reservation.new(id: id, room: room, date_range: date_range, price: price)
    # end
  end
end
