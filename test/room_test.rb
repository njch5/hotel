require_relative "test_helper"
require "pry"

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

  describe "is_available? method" do
    before do
      @room = Hotel::Room.new(id: 10)
      @date_range_one = Hotel::DateRange.new(start_date: "2019-04-08", end_date: "2019-04-15")
      @date_range_two = Hotel::DateRange.new(start_date: "2019-05-12", end_date: "2019-05-16")
      @date_range_three = Hotel::DateRange.new(start_date: "2019-03-09", end_date: "2019-03-16")

      @reservation_one = Hotel::Reservation.new(
        id: 5,
        date_range: @date_range_one,
        room: @room,
        room_id: @room.id,
      )

      @reservation_two = Hotel::Reservation.new(
        id: 8,
        date_range: @date_range_two,
        room: @room,
        room_id: @room.id,
      )

      @reservation_three = Hotel::Reservation.new(
        id: 3,
        date_range: @date_range_three,
        room: @room,
        room_id: @room.id,
      )
      @room.add_reservation(@reservation_one)
      @room.add_reservation(@reservation_two)
      @room.add_reservation(@reservation_three)
    end

    # it "returns the id of the available room" do
    #   expect(@room_two.id).must_equal 9
    # end

    it "will return true if a room is available given a date range" do
      @dates_one = Hotel::DateRange.new(start_date: "2019-03-25", end_date: "2019-03-30")
      @dates_two = Hotel::DateRange.new(start_date: "2019-02-03", end_date: "2019-02-10")
      expect(@room.is_available?(@dates_one)).must_equal true
      expect(@room.is_available?(@dates_two)).must_equal true
    end

    it "will return false if a room is unavailable given a date range" do
      @dates_three = Hotel::DateRange.new(start_date: "2019-03-10", end_date: "2019-03-15")
      expect(@room.is_available?(@dates_three)).must_equal false
    end

    it "will return true when a room is available after a previous reservation has ended" do
    end
  end
end
