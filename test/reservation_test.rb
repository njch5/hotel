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

    it "is set up with specific attributes and data types" do
      expect(@reservation.id).must_be_instance_of Integer
      expect(@reservation.id).must_equal 1
      expect(@reservation.date_range).must_be_instance_of Hotel::DateRange
      expect(@reservation.room).must_be_instance_of Hotel::Room
      expect(@reservation.room_id).must_be_instance_of Integer
      expect(@reservation.room_id).must_equal 1
      expect(@reservation.price).must_equal 200
    end
  end
end
