require_relative "test_helper"

describe "Reservation class" do
  describe "#initialize method" do
    before do
      @room = Hotel::Room.new(id: 1)
      @date_range = Hotel::DateRange.new(start_date: "2019-07-12", end_date: "2019-07-15")
      @reservation = Hotel::Reservation.new(
        id: 1,
        date_range: @date_range,
        room: @room,
        room_id: @room.id,
        price: 200,
      )
    end

    it "Creates an instance of Reservation" do
      expect(@reservation).must_be_instance_of Hotel::Reservation
    end
  end
end
