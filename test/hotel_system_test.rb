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
  end
end
