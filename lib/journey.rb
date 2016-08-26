require_relative 'oystercard'
# => Knows everything about a journey
class Journey

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

private

  attr_reader :entry_station, :exit_station

end
