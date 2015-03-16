require_relative '../../../helpers/methods_practice_helpers'

describe MethodsPracticeHelpers do
  include MethodsPracticeHelpers

  describe '#current_date_and_time' do

    it 'returns the properly formatted date and time for February 14, 2015 at 7:27pm' do
      class Time
        def self.now
          Time.at(1423960041)
        end
      end

      expect(current_date_and_time).to eq('February 14, 2015 at 7:27pm')
    end

    it 'returns the properly formatted date and time for May 6, 2008 at 1:56am' do
      class Time
        def self.now
          Time.at(1210053366)
        end
      end

      expect(current_date_and_time).to eq('May 6, 2008 at 1:56am')
    end

  end

end