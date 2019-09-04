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

    # def reservations_by_date(specific_date)
    #   @reservations.dates.include?(specific_date)
    #   return @reservations
    # end
  end
end
