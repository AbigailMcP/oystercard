require "journey"

describe Journey do

  let(:station) { double :station}

  it 'stores entry station' do
    subject.start(station)
    expect(subject.instance_variable_get(:@entry_station)).to eq station
  end

  it 'stores exit station' do
    subject.start(station)
    subject.finish(station)
    expect(subject.instance_variable_get(:@exit_station)).to eq station
  end

xdescribe '#fare' do
  it 'calculates a fare' do
    subject.start(station)
    subject.finish(station)
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end

  it 'charges a penalty fare for an incomplete journey' do
    subject.start(station)
    subject.finish(station)
    subject.finish(station)
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end


end
end
