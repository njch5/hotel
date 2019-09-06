require_relative "room"
require_relative "date_range"
require_relative "block"

module Hotel
  class Reservation
    attr_reader :id, :room, :date_range, :price, :block

    def initialize(id:, room: nil, date_range:, price: 200, block: nil)
      @id = id
      @room = room
      @date_range = date_range
      @price = price
      @block = block
    end

    def total_cost_per_night
      price * date_range.duration
    end

    def overlap?(other_date_range)
      return true if @date_range.overlap?(other_date_range)
    end

    def include_date?(other_date)
      return (date_range.start_date <= other_date) && (date_range.end_date >= other_date)
    end
  end
end
