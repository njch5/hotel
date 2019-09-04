# require_relative "reservation"
require_relative "date_range"

module Hotel
  class Room
    attr_reader :id, :reservations

    def initialize(id:, reservations: nil)
      @id = id
      @reservations = reservations || []
    end

    def add_reservation(reservation)
      @reservations << reservation
    end

    def is_available?(date_range)
      @reservations.each do |res|
        if res.overlap?(date_range)
          return false
        end
      end
    end
  end
end
