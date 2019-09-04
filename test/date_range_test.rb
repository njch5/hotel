require_relative "test_helper"

describe "DateRange Class" do
  describe "initialize" do
    before do
      @date_range = Hotel::DateRange.new(start_date: "2019-08-25", end_date: "2019-08-30")
    end

    it "is an instance of DateRange" do
      expect(@date_range).must_be_kind_of Hotel::DateRange
    end

    it "raises an ArgumentError if end date is less than or equal to start date" do
      expect do
        Hotel::DateRange.new("2019-08-25", "2019-08-25")
      end.must_raise ArgumentError
    end
  end

  describe "Date method" do
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
    it "will returns true if two date ranges overlap" do
      @date_range_one = Hotel::DateRange.new(start_date: "2019-07-15", end_date: "2019-07-30")
      @date_range_two = Hotel::DateRange.new(start_date: "2019-07-05", end_date: "2019-07-16")

      expect(@date_range_one.overlap?(@date_range_two)).must_equal true
    end

    it "will return false if two dates don't overlap" do
      @date_range_one = Hotel::DateRange.new(start_date: "2019-05-10", end_date: "2019-05-30")
      @date_range_two = Hotel::DateRange.new(start_date: "2019-06-05", end_date: "2019-06-16")

      expect(@date_range_one.overlap?(@date_range_two)).must_equal false
    end
  end
end
