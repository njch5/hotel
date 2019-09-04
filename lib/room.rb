require_relative "hotel_system"

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

    def is_available?
      rooms = (1..20).to_a
      return true if rooms.find { |room| room == id } && !(@reservations.room_id.include?(id))
    end
  end
end
