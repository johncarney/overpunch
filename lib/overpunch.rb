require "overpunch/version"

module Overpunch
  POS_OVERPUNCH_SET = '{ABCDEFGHI'.freeze
  NEG_OVERPUNCH_SET = '}JKLMNOPQR'.freeze

  OVERPUNCH_PATTERN = /\A\s*0*(\d*(([#{POS_OVERPUNCH_SET}])|([#{NEG_OVERPUNCH_SET}])))\s*\Z/.freeze

  def self.parse(string)
    unless matches = string.match(OVERPUNCH_PATTERN)
      raise ArgumentError, "Invalid overpunch string: \"#{string}\""
    end

    sign, overpunch_set = if matches[3]
      [  1, POS_OVERPUNCH_SET ]
    else
      [ -1, NEG_OVERPUNCH_SET ]
    end
    sign * matches[1].tr(overpunch_set, '0-9').to_i
  end

  def self.format(number, width: nil)
    overpunch_set = if number < 0
      NEG_OVERPUNCH_SET
    else
      POS_OVERPUNCH_SET
    end
    abs_number = number.abs
    formatted = abs_number.to_s[0..-2] + overpunch_set[abs_number % 10]
    padding = [ (width || 0) - formatted.size, 0 ].max
    ("0" * padding) + formatted
  end
end
