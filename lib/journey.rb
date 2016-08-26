require_relative 'oystercard'
# => Knows everything about a journey
class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def complete?
    !!entry_station && !!exit_station
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

private

  attr_reader :entry_station, :exit_station

end
