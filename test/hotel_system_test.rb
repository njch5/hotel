require_relative "test_helper"

describe "Hotel_System class" do
  describe "initialize" do
    before do
      @hotel_system = Hotel::HotelSystem.new
      @rooms = (1..20).to_a
      @reservations = []
    end

    it "is an instance of HotelSystem" do
      expect(@hotel_system).must_be_instance_of Hotel::HotelSystem
    end

    it "returns an array of rooms" do
      expect(@rooms).must_be_kind_of Array
      expect(@rooms).must_include 1, 20
    end

    it "will return an empty reservations array if there are no reservations" do
      expect(@reservations.length).must_equal 0
    end

    it "will return all the rooms in the hotel" do
      expect(@hotel_system.list_of_rooms).must_be_kind_of Array
      expect(@hotel_system.list_of_rooms.length).must_equal 20
    end
  end

  describe "reservations_by_date method" do
    before do
      @room_one = Hotel::Room.new(id: 10)
      @date_range_one = Hotel::DateRange.new(start_date: "2019-05-08", end_date: "2019-05-18")
      @reservation_one = Hotel::Reservation.new(
        id: 2,
        date_range: @date_range_one,
        room: @room_one,
        room_id: @room_one.id,
        price: 200,
      )

      @room_two = Hotel::Room.new(id: 5)
      @date_range_two = Hotel::DateRange.new(start_date: "2019-05-08", end_date: "2019-05-10")
      @reservation_two = Hotel::Reservation.new(
        id: 3,
        date_range: @date_range_two,
        room: @room_two,
        room_id: @room_two.id,
        price: 200,
      )

      @room_one.add_reservation(@reservation_one)
      @room_two.add_reservation(@reservation_two)
    end

    # it "returns a list of reservations on a specific date" do
    #   hotel_system = Hotel::HotelSystem.new
    #   date_range = Hotel::DateRange(start_date: "2019-04-04", end_date: "2019-04-08")
    #   expect(@room_one.reservations_by_date).must_include @reservation_one
    # end
  end
end
