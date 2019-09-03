module Hotel
  class DateRange
    attr_reader :start_date, :end_date

    def initialize(start_date:, end_date:)
      @start_date = Date.parse(start_date)
      @end_date = Date.parse(end_date)

      raise ArgumentError, "End date cannot be the same or less than the start date!" if @end_date <= @start_date
    end

    def dates
      return start_date..end_date
    end

    def duration
      end_date - start_date
    end
  end
end
