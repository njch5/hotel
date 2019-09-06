require_relative "date_range"
require_relative "room"
require_relative "reservation"

module Hotel
  class Block
    attr_reader :id, :rooms, :date_range, :discounted_price, :reservations

    def initialize(id:, rooms:, date_range:, discounted_price:)
      @id = id
      if rooms.count < 1 || rooms.count > 5
        raise ArgumentError, "A block has to have between 1 to 5 rooms!"
      end
      @rooms = rooms
      @date_range = date_range
      @discounted_price = discounted_price
      @block_reservations = []
    end

    def overlap?(other_date_range)
      return true if @date_range.overlap?(other_date_range)
    end

    def add_reservation(reservation)
      @block_reservations << reservation
    end

    def find_available_room
      room = @rooms.find { |room| room.is_available?(date_range) }
      raise ArgumentError, "No available rooms! All are booked" unless room
    end
  end
end
