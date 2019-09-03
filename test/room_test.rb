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
  end
end
