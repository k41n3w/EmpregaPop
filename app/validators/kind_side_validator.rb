class KindSideValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    validate_side_kind if @record.side.present?
  end

  private

  def left_kind?
    %w[profile about social contact additional_information].include? @record.kind
  end

  def right_kind?
    %w[education experience hobby skill language additional_information].include? @record.kind
  end

  def validate_side_kind
    @record.errors.add(:base, "can't be at #{@record.side} side") unless send("#{@record.side}_kind?")
  end
end
