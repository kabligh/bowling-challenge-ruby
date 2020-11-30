require 'frame'

describe Frame do

  let(:frame1) { Frame.new(1, 0) }

  describe '#initialize' do
    it 'starts with an empty array of rolls' do
      expect(frame1.rolls.length).to eq 0
    end

    it 'starts with 10 pins remaining' do
      expect(frame1.remaining_pins).to eq 10
    end
  end

  describe '#played?' do
    it 'returns true for a strike' do
      frame1.roll(10)
      expect(frame1.played?).to eq true
    end

    it 'returns false for one roll that is not a strike' do
      frame1.roll(9)
      expect(frame1.played?).to eq false
    end

    it 'returns true for two rolls' do
      frame1.roll(1)
      frame1.roll(2)
      expect(frame1.played?).to eq true
    end
  end

  describe '#roll' do
    it 'reduces the number of pins after a roll' do
      frame1.roll(5)
      expect(frame1.remaining_pins).to eq 5
    end
    it 'records the roll in the rolls array' do
      frame1.roll(5)
      expect(frame1.rolls[0]).to eq 5
    end
  end

  describe '#score' do
    it 'gives the score of the frame' do
      frame1.roll(8)
      frame1.roll(1)
      expect(frame1.score).to eq 9
      p frame1
    end
  end
end
