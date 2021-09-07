class DateIntervalValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    if @record.start_date.present?
      validate_future_start_date
      validate_start_date_after_end_date if @record.end_date.present?
    end
  end

  private

  def validate_future_start_date
    @record.errors.add(:start_date, 'must be a past date') if @record.start_date >= Time.zone.now
  end

  def validate_start_date_after_end_date
    @record.errors.add(:start_date, 'must be a date before end date') if @record.start_date >= @record.end_date
  end
end
