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
      expect(@reservation.price).must_equal 200
    end

    it "returns reservation of a room for a given date range" do
      expect(@reservation.room.id).must_equal 1
      expect(@reservation.date_range.start_date).must_equal Date.parse("2019-07-12")
      expect(@reservation.date_range.end_date).must_equal Date.parse ("2019-07-15")
    end
  end

  describe "Total cost method" do
    before do
      @room = Hotel::Room.new(id: 8)
      @date_range = Hotel::DateRange.new(start_date: "2019-09-08", end_date: "2019-09-15")
      @reservation = Hotel::Reservation.new(id: 3, date_range: @date_range, room: @room, price: 200)
    end

    it "is an instance of Reservation" do
      expect(@reservation).must_be_instance_of Hotel::Reservation
    end

    it "returns the total cost of a reservation" do
      expect(@reservation.total_cost).must_equal 1400
    end
  end
end
