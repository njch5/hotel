require_relative "test_helper"

describe "DateRange Class" do
  describe "initialize" do
    before do
      @date_range = Hotel::DateRange.new(start_date: "2019-08-25", end_date: "2019-08-30")
    end

    it "is an instance of DateRange" do
      expect(@date_range).must_be_kind_of Hotel::DateRange
    end
  end
end
