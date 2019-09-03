module Hotel
  class HotelSystem
    attr_reader :rooms, :reservations

    def initialize
      @rooms = (1..20).to_a
      @reservations = []
    end
  end
end
