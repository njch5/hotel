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
  end
end
