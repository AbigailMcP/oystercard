require_relative 'oystercard'
# => Knows everything about a journey
class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :history

  def initialize()
    @history = []
    @current_journey = {}
  end

  def complete?

    case
    when !!@history[-1][:in] && !@history[-1][:out]
      false
    when !@history[-1][:in] && !!@history[-1][:out]
      false
    else
      true
    end

  end

  def start(station)
    @history << {:in => station, :out => nil}
  end

  def finish(station)
    if complete?
      @history << {:in => nil, :out => station}
    else
      @history[-1][:out] = station
    end
  end

  def completed_journeys
    @current_journey
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end


attr_reader :current_journey, :history

end
