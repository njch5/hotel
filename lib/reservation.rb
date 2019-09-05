require_relative "room"
require_relative "date_range"

module Hotel
  class Reservation
    attr_reader :id, :room, :date_range, :price

    def initialize(id:, room:, date_range:, price: 200)
      @id = id
      @room = room
      @date_range = date_range
      @price = price
    end

    def total_cost
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
