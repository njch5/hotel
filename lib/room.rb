module Hotel
  class Room
    attr_reader :id, :reservations

    def initialize(id:, reservations: nil)
      @id = id
      @reservations = reservations || []
    end
  end
end
