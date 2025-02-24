require_relative "room"
require_relative "reservation"
require_relative "date_range"
require_relative "block"
require "pry"

module Hotel
  class HotelSystem
    attr_reader :rooms, :reservations

    def initialize
      @rooms = []
      @reservations = []
      @blocks = []

      (1..20).each do |num|
        @rooms << Hotel::Room.new(id: num)
      end
    end

    def list_of_rooms
      return @rooms
    end

    def reserve_room(start_date:, end_date:, price: 200)
      id = create_id(@reservations)
      date_range = Hotel::DateRange.new(start_date: start_date, end_date: end_date)
      room = available_room(date_range)
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
      room = open_rooms(date_range).find { |a_room| a_room }
      raise StandardError, "No available rooms!" unless room
      return room
    end

    def add_a_reservation(reservation)
      add_reservation(reservation)
    end

    def create_a_block(date_range:, rooms:, discounted_price:)
      block_available = rooms.all? { |room| room.is_available?(date_range) }
      raise StandardError, "At least one of the rooms is unavailable on this date!" unless block_available
      id = create_id(@blocks)
      block = Hotel::Block.new(id: id, rooms: rooms, date_range: date_range, discounted_price: discounted_price)
      @blocks << block
      return block
    end

    def reserve_a_block(block)
      id = create_id(reservations)
      date_range = block.date_range
      room = block.find_available_room
      price = block.discounted_price
      return Hotel::Reservation.new(id: id, room: room, date_range: date_range, price: price, block: block)
    end

    def reserve_a_room_from_block(block)
      raise StandardError, "Room not available in block!" unless reserve_room = block.reserve_a_room
    end

    private

    def create_id(object)
      return object.count + 1
    end

    def add_reservation(reservation)
      @reservations << reservation
    end
  end
end
