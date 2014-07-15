require "overpunch/version"

class Overpunch
  POS_OVERPUNCH_SET = '{ABCDEFGHI'.freeze
  NEG_OVERPUNCH_SET = '}JKLMNOPQR'.freeze

  OVERPUNCH_PATTERN = /\A\s*(\d*(([#{POS_OVERPUNCH_SET}])|([#{NEG_OVERPUNCH_SET}])))\s*\Z/.freeze

  def initialize(value, width: nil)
    @width = width && width.to_i
    if value.respond_to?(:to_int)
      @value = value.to_int
    elsif value.respond_to?(:match) && (matches = value.match(PATTERN))
      @width ||= value.size
      sign, overpunch_set = if matches[3]
        [  1, POS_OVERPUNCH_SET ]
      else
        [ -1, NEG_OVERPUNCH_SET ]
      end
      @value = sign * matches[1].tr(overpunch_set, '0-9').to_i
    else
      raise ArgumentError, "Invalid overpunch value: \"#{value}\""
    end
  end

  def to_i
    @value
  end

  def to_s
    abs_value = @value.abs
    width = @width && (@width - 1) || ''
    overpunch_set = if @value < 0
      NEG_OVERPUNCH_SET
    else
      POS_OVERPUNCH_SET
    end
    "%0#{width}d%s" % [ abs_value / 10, overpunch_set[abs_value % 10] ]
  end
end
