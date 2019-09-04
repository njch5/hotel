require_relative "room"
require_relative "reservation"
require_relative "date_range"

module Hotel
  class HotelSystem
    attr_reader :rooms, :reservations

    def initialize
      @rooms = (1..20).to_a
      @reservations = []
    end

    def list_of_rooms
      return @rooms
    end

    # def reservations_by_date(specific_date_range)
    #   return @reservations.dates.select do |res|
    #            res.same_dates?(specific_date_range)
    #          end
    # end
  end
end
