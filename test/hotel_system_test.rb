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

    describe "Reserve Room Method" do
      before do
        @hotel_system = Hotel::HotelSystem.new
        @start_date = "2019-07-08"
        @end_date = "2019-07-15"
        @date_range = Hotel::DateRange.new(start_date: @start_date, end_date: @end_date)
        @rooms = @hotel_system.list_of_rooms
        @assigned_room = @hotel_system.available_room(@date_range)

        @start_date_two = "2019-08-10"
        @end_date_two = "2019-08-15"
        @date_range_two = Hotel::DateRange.new(start_date: @start_date, end_date: @end_date_two)
      end
      it "will reserve a room and return its attributes" do
        @reserved_room = @hotel_system.reserve_room(start_date: @start_date, end_date: @end_date)
        @second_reserved_room = @hotel_system.reserve_room(start_date: @start_date_two, end_date: @end_date_two)
        expect(@reserved_room.id).must_equal 1
        expect(@second_reserved_room.id).must_equal 2

        expect(@reserved_room.date_range.start_date).must_equal Date.parse("2019-07-08")
        expect(@reserved_room.date_range.end_date).must_equal Date.parse("2019-07-15")
        expect(@second_reserved_room.date_range.start_date).must_equal Date.parse("2019-08-10")
        expect(@second_reserved_room.date_range.end_date).must_equal Date.parse("2019-08-15")
      end

      it "raises an ArgumentError when there are no available rooms" do
        expect do
          21.times do
            @hotel_system.reserve_room(start_date: @start_date, end_date: @end_date)
          end.must_raise ArgumentError
        end
      end
    end

    describe "Open Rooms Method" do
      before do
        @hotel_system = Hotel::HotelSystem.new
        @date_range = Hotel::DateRange.new(start_date: "2019-03-10", end_date: "2019-03-20")
      end

      it "will pick an available room from open rooms method" do
        @hotel_system.open_rooms(@date_range)
        @room = @hotel_system.available_room(@date_range)
        expect(@room.id).must_equal 1
      end

      it "returns all the open rooms" do
        @all_open_rooms = @hotel_system.open_rooms(@date_range)
        expect(@all_open_rooms.length).must_equal 20
      end
    end
  end

  describe "reservations_by_date method" do
    before do
      @hotel_system = Hotel::HotelSystem.new
      @date_range_one = Hotel::DateRange.new(start_date: "2019-05-08", end_date: "2019-05-18")
      @reservation_one = Hotel::Reservation.new(
        id: 2,
        date_range: @date_range_one,
        room: @hotel_system.rooms.first,
        price: 200,
      )

      @date_range_two = Hotel::DateRange.new(start_date: "2019-05-08", end_date: "2019-05-10")
      @reservation_two = Hotel::Reservation.new(
        id: 3,
        date_range: @date_range_two,
        room: @hotel_system.rooms.last,
        price: 200,
      )

      @hotel_system.add_reservation(@reservation_one)
      @hotel_system.add_reservation(@reservation_two)
    end

    it "returns a list of reservations on a specific date" do
      @hotel_system = Hotel::HotelSystem.new
      @start_date = "2019-03-08"
      @end_date = "2019-03-15"
      @date_range = Hotel::DateRange.new(start_date: @start_date, end_date: @end_date)
      @rooms = @hotel_system.list_of_rooms
      @assigned_room = @hotel_system.available_room(@date_range)

      @reservation = @hotel_system.reserve_room(
        start_date: @start_date,
        end_date: @end_date,
      )
      @date_range = Hotel::DateRange.new(start_date: "2019-04-04", end_date: "2019-04-08")
      expect(@hotel_system.reservations_by_date(Date.parse("2019-03-15"))).must_equal [@reservation]
    end

    it "returns an empty array if there are no reservations on a specific date" do
      @date_range = Hotel::DateRange.new(start_date: "2019-04-04", end_date: "2019-04-08")
      expect(@hotel_system.reservations_by_date(Date.parse("2019-04-06"))).must_equal []
    end
  end

  describe "Create a block method" do
    before do
      @hotel_system = Hotel::HotelSystem.new
      @start_date = "2019-11-03"
      @end_date = "2019-11-10"
      @date_range = Hotel::DateRange.new(start_date: @start_date, end_date: @end_date)
      @rooms = @hotel_system.rooms[0..3]
      @discounted_price = 160
      @block = @hotel_system.create_a_block(date_range: @date_range, rooms: @rooms, discounted_price: @discounted_price)
    end
    it "holds the attributes and its data types" do
      expect(@block).must_be_instance_of Hotel::Block
      expect(@block.date_range).must_be_instance_of Hotel::DateRange
      expect(@block.rooms).must_be_instance_of Array
      expect(@block.discounted_price).must_be_instance_of Integer
    end
  end

  describe "Reserve a block method" do
    before do
      @hotel_system = Hotel::HotelSystem.new
      @start_date = "2019-12-03"
      @end_date = "2019-12-08"
      @date_range = Hotel::DateRange.new(start_date: @start_date, end_date: @end_date)
      @rooms = @hotel_system.rooms[0..4]
      @discounted_price = 180
      @block = @hotel_system.create_a_block(date_range: @date_range, rooms: @rooms, discounted_price: @discounted_price)

      @blocked_reservation = @hotel_system.reserve_a_block(@block)
    end

    it "reservation and block will have the same dates" do
      expect(@blocked_reservation).must_be_instance_of Hotel::Reservation
    end

    it "does not include rooms in a block on open rooms list" do
      list_of_rooms = @hotel_system.open_rooms(@date_range)
      @rooms.each do |a_room|
        expect(list_of_rooms.include?(@block.rooms)).must_equal false
      end
    end

    # it "will exclude rooms that have already been booked" do

    # end
  end
end
