class HttpUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    @value = value
    record.errors.add(attribute, "is not a valid url") if value.present? && !valid_url?
  end

  private

  def valid_url?
    uri = URI.parse(@value)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end
end
