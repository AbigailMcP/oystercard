require 'journey'

describe Journey do

subject(:journey) { described_class.new(station1, nil) }
let(:station1) { double :station1 }
let(:station2) { double :station2 }

  describe '#given an entry station' do

    it 'should have an entry station' do
      expect(journey.entry_station).to eq station1
    end

  end

  describe '#finish' do

    it 'should record the exit station' do
      journey.finish(station2)
      expect(journey.exit_station).to eq station2
    end

    it 'should return the current journey' do
      expect(journey.finish(station2)).to eq journey
    end

  end

  describe '#fare' do

    it 'should return the minimum fare when finished journey' do
      journey.finish(station2)
      expect(journey.fare).to eq Journey::MIN_FARE
    end

    it 'should be able to charge a penalty' do
      expect(journey.fare).to eq Journey::PEN_FARE
    end

  end

    it'should check if a journey is complete' do
      journey.finish(station2)
      expect(journey).to be_complete
    end

end
