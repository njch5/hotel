require_relative "test_helper"

describe "Block class" do
  describe "initialize" do
    before do
      @rooms = []
      (1..5).each do |num|
        @rooms << Hotel::Room.new(id: num)
      end

      @date_range = Hotel::DateRange.new(start_date: "2019-01-20", end_date: "2019-02-05")

      @block = Hotel::Block.new(id: 1, date_range: @date_range, discounted_price: 120, rooms: @rooms)
    end

    it "is an instance of Block" do
      expect(@block).must_be_instance_of Hotel::Block
    end

    it "has specific attributes and data types" do
      expect(@block.id).must_be_instance_of Integer
      expect(@block.date_range).must_be_kind_of Hotel::DateRange
      expect(@block.discounted_price).must_be_instance_of Integer
      expect(@block.rooms).must_be_instance_of Array
    end
  end

  describe "Error for invalid number of rooms in a block" do
    it "raises an ArgumentError if a block has no rooms" do
      @rooms = []

      @date_range = Hotel::DateRange.new(start_date: "2019-09-16", end_date: "2019-09-22")

      expect do
        @block = Hotel::Block.new(id: 2, date_range: @date_range, discounted_price: 100, rooms: @rooms)
      end.must_raise ArgumentError
    end

    it "raises an ArgumentError if a block has more than 5 rooms" do
      @rooms = []
      (1..6).each do |num|
        @rooms << Hotel::Room.new(id: num)
      end

      @date_range = Hotel::DateRange.new(start_date: "2019-03-05", end_date: "2019-03-18")

      expect do
        @block = Hotel::Block.new(id: 3, date_range: @date_range, discounted_price: 135, rooms: @rooms)
      end.must_raise ArgumentError
    end
  end
  describe "Connect rooms method" do
    it "will connect the rooms to the block" do
      @room1 = Hotel::Room.new(id: 1)
      @room2 = Hotel::Room.new(id: 2)
      @date_range = Hotel::DateRange.new(start_date: "2019-11-18", end_date: "2019-11-20")
      @rooms = [@room1, @room2]
      @block = Hotel::Block.new(id: 1, date_range: @date_range, discounted_price: 150, rooms: @rooms)

      r1block = @room1.blocks
      r2block = @room2.blocks
      expect(r1block.include?(@block)).must_equal true
    end
  end
end
