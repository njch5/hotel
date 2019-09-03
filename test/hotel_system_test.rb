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
end
