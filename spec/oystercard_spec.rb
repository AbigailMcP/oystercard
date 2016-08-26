require 'oystercard'

describe Oystercard do
      let(:journey) {double :journey, start: nil, finish: nil, fare: 1, complete?: false}
      let(:journey_class_double) {double :journey_class_double, new: journey}
      subject(:oystercard) {described_class.new(journey: journey_class_double)}
      let(:amount) { double :amount }
      let(:station) { double :station }
      let(:station2) { double :station2 }

  describe 'error messages' do

    it 'raises an error when balance is less than minimum balance' do
      expect { oystercard.touch_in(station) }.to raise_error 'below minimum balance'
    end

    it 'raises an error when more than £90 is added' do
      LIMIT = Oystercard::LIMIT
      oystercard.top_up(LIMIT)
      expect{ oystercard.top_up 5 }.to raise_error "Limit £#{LIMIT} exceeded"
    end

  end

  describe 'interaction with Journey class' do

    # it 'creates a new journey on touch in' do
    #     subject.top_up(20)
    #     subject.touch_in(station)
    #     expect(journey).to have_received(:start)
    # end

    it 'sends a finish message to journey class' do
      subject.top_up(20)
      subject.touch_out(station)
      expect(journey).to have_received(:finish)
    end

  end

  describe 'charging for journeys' do

    before(:each) do
      subject.top_up(20)
      subject.touch_in(station)
    end

    it 'charges a fee when touched out' do
      expect{subject.touch_out(station)}.to change{subject.instance_variable_get(:@balance)}.by(-1)
    end

    it 'charges a penalty fee when touched in twice' do
      expect{subject.touch_in(station)}.to change{subject.instance_variable_get(:@balance)}.by(-6)
    end

    it 'charges a penalty fee when touched out twice' do
      subject.touch_out(station)
      expect{subject.touch_out(station)}.to change{subject.instance_variable_get(:@balance)}.by(-6)
    end

  end

end
