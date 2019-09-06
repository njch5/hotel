require_relative "test_helper"

describe "DateRange Class" do
  describe "initialize" do
    before do
      @date_range = Hotel::DateRange.new(start_date: "2019-08-25", end_date: "2019-08-30")
    end

    it "is an instance of DateRange" do
      expect(@date_range).must_be_kind_of Hotel::DateRange
    end

    it "takes a start and end date" do
      expect(@date_range).must_respond_to :start_date
      expect(@date_range.start_date).must_equal Date.parse("2019-08-25")

      expect(@date_range).must_respond_to :end_date
      expect(@date_range.end_date).must_equal Date.parse("2019-08-30")
    end

    it "raises an ArgumentError if end date is equal to start date" do
      expect do
        Hotel::DateRange.new("2019-08-25", "2019-08-25")
      end.must_raise ArgumentError
    end

    it "raises an ArgumentError if end date is before start date" do
      expect do
        Hotel::DateRange.new(start_date: "2019-08-20", end_date: "2019-08-10")
      end.must_raise ArgumentError
    end

    it "raises an ArgumentError if no dates are given" do
      expect do
        Hotel::DateRange.new(start_date: "", end_date: "")
      end.must_raise ArgumentError
    end
  end

  describe "Dates method" do
    before do
      @date_range = Hotel::DateRange.new(start_date: "2019-09-05", end_date: "2019-09-20")

      @start_date = Date.parse("2019-09-05")
      @end_date = Date.parse("2019-09-20")
    end

    it "returns instances of Date" do
      expect(@date_range.dates).must_equal (@start_date..@end_date)
    end

    it "returns the duration of stays (number of nights)" do
      expect(@date_range.duration).must_equal 15
    end
  end

  describe "Overlap? method" do
    it "will return true if two date ranges overlap" do
      @date_range_one = Hotel::DateRange.new(start_date: "2019-07-15", end_date: "2019-07-30")
      @date_range_two = Hotel::DateRange.new(start_date: "2019-07-05", end_date: "2019-07-16")

      expect(@date_range_one.overlap?(@date_range_two)).must_equal true
    end

    it "will return false if two date ranges don't overlap" do
      @date_range_one = Hotel::DateRange.new(start_date: "2019-05-10", end_date: "2019-05-30")
      @date_range_two = Hotel::DateRange.new(start_date: "2019-06-05", end_date: "2019-06-16")

      expect(@date_range_one.overlap?(@date_range_two)).must_equal false
    end

    it "will return false if one date range's start date is on the same day as the other date range's end date" do
      @date_range_one = Hotel::DateRange.new(start_date: "2019-10-05", end_date: "2019-10-30")
      @date_range_two = Hotel::DateRange.new(start_date: "2019-10-30", end_date: "2019-11-05")

      expect(@date_range_one.overlap?(@date_range_two)).must_equal false
    end

    it "will return true if one date range is within another date range" do
      @date_range_one = Hotel::DateRange.new(start_date: "2019-02-10", end_date: "2019-02-28")
      @date_range_two = Hotel::DateRange.new(start_date: "2019-02-15", end_date: "2019-02-18")

      expect(@date_range_one.overlap?(@date_range_two)).must_equal true
    end

    it "will return true when one date range starts before the other date range begins" do
      @date_range_one = Hotel::DateRange.new(start_date: "2019-06-12", end_date: "2019-06-18")
      @date_range_two = Hotel::DateRange.new(start_date: "2019-06-10", end_date: "2019-06-30")

      expect(@date_range_one.overlap?(@date_range_two)).must_equal true
    end
  end
end
