require_relative "date_range"
require_relative "room"

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
      @reserve_room_hash = {}
    end

    # def overlap?(other_date_range)
    #   return true if @date_range.overlap?(other_date_range)
    # end

    # def add_reservation(reservation)
    #   @block_reservations << reservation
    # end

    def find_available_room
      # checks through each room to see if room is available in reserve_room_hash
      rooms.each do |a_room|
        if @reserve_room_hash[a_room] == nil
          raise ArgumentError, "No available rooms! All are booked" unless a_room
          return a_room
        else
        end
      end
      # room = @rooms.find { |a_room| a_room.is_available?(date_range) }
      # raise ArgumentError, "No available rooms! All are booked" unless room
    end

    def reserve_a_room
      # find_available_room will raise an error if there are no available rooms
      # key for reserve_room_hash are the rooms and the values are whether the rooms are available or not
      bookable_room = find_available_room
      return @reserve_room_hash[bookable_room] = true
    end
  end
end
