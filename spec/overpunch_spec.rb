require "overpunch"

RSpec::Matchers.define :be_zero_padded do |expected_zeroes|
  def pluralize_zero(number)
    if number == 1
      "#{number} zero"
    else
      "#{number} zeroes"
    end
  end

  match do |actual|
    actual.match(/\A0{#{expected_zeroes}}[^0]/)
  end

  description do
    "be padded with #{pluralize_zero(expected_zeroes)}"
  end

  failure_message do |actual|
    "expected \"#{actual}\" to be padded with exactly #{pluralize_zero(expected_zeroes)}"
  end

  failure_message_when_negated do |actual|
    "did not expect \"#{actual}\" to be padded with #{pluralize_zero(expected_zeroes)}"
  end
end


describe Overpunch do
  describe ".parse" do
    subject(:parse) { Overpunch.parse(value) }

    context "given a positive overpunch string" do
      let(:expected_value)  { rand 0..1000 }
      let(:value)           { "%d%s" % [ expected_value / 10, "{ABCDEFGHI"[expected_value % 10] ] }

      it { is_expected.to eq expected_value }
    end

    context "given a negative overpunch string" do
      let(:expected_value)  { -rand(0..1000) }
      let(:value)           { "%d%s" % [ expected_value.abs / 10, "}JKLMNOPQR"[expected_value.abs % 10] ] }

      it { is_expected.to eq expected_value }
    end

    context "given leading zeroes" do
      let(:expected_value)  { rand 0..1000 }
      let(:value)           { "%s%d%s" % [ "0" * rand(1..2), expected_value / 10, "{ABCDEFGHI"[expected_value % 10] ] }

      it { is_expected.to eq expected_value }
    end

    context "given an invalid overpunch string" do
      let(:value) { "123X" }

      example { expect { parse }.to raise_error ArgumentError, "Invalid overpunch value: \"#{value}\"" }
    end
  end

  describe '.format' do
    let(:width) { nil }

    subject { Overpunch.format(value, width: width) }

    {
         0 =>   "{",
         5 =>   "E",
        10 =>  "1{",
       321 => "32A",
       219 => "21I",
        -2 =>   "K",
       -10 =>  "1}",
      -431 => "43J",
      -729 => "72R"
    }.each do |integer_value, expected_overpunch|
      context "given #{integer_value}" do
        let(:value) { integer_value }

        it { is_expected.to eq expected_overpunch }
      end
    end

    describe "zero-padding" do
      let(:width) { 4 }

      {  1000 => 0,
        -1000 => 0,
            1 => 3,
          -10 => 2,
          123 => 1
      }.each do |integer_value, expected_zeroes|
        context "given #{integer_value}" do
          let(:value) { integer_value }

          it { is_expected.to be_zero_padded(expected_zeroes) }
        end
      end
    end
  end
end
