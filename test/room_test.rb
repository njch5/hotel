require_relative "test_helper"

describe "Room class" do
  describe "initialize" do
    before do
      @room = Hotel::Room.new(id: 5)
      @reservations = []
    end

    it "is an instance of room" do
      expect(@room).must_be_instance_of Hotel::Room
    end

    it "returns a room id" do
      expect(@room.id).must_equal 5
    end

    it "will return an empty array if there are no reservations" do
      expect(@reservations).must_equal []
    end
  end

  describe "Add reservation method" do
    before do
      @room = Hotel::Room.new(id: 8)
      @date_range = Hotel::DateRange.new(start_date: "2019-07-12", end_date: "2019-07-15")
      @reservation = Hotel::Reservation.new(
        id: 1,
        date_range: @date_range,
        room: @room,
        room_id: @room.id,
        price: 200,
      )
    end

    it "will add a reservation to a room" do
      @room.add_reservation(@reservation)
      expect(@room.reservations.include?(@reservation))
    end
  end
end
