require_relative "room"
require_relative "date_range"

module Hotel
  class Reservation
    attr_reader :id, :room, :room_id, :date_range, :price

    def initialize(id:, room:, room_id:, date_range:, price: 200)
      @id = id
      @room = room
      @room_id = room.id
      @date_range = date_range
      @price = price
    end

    def total_cost
      price * date_range.duration
    end

    def overlap?(other_date_range)
      return date_range.overlap?(other_date_range)
    end
  end
end
