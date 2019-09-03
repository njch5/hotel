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

  # describe "Add reservation method" do
  #   before do
  #     @room = Hotel::Room.new(id: 8)
  #     @date_range = Hotel::DateRange.new(start_date: "2019-07-12", end_date: "2019-07-15")
  #     @reservation = Hotel::Reser
  # end
end
