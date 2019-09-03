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
end
