require_relative 'oystercard'
# => Knows everything about a journey
class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :history

  def initialize
    @history = []
    @current_journey = {}
  end

  def complete?

    case
    # when !!current_journey[:in] && !!current_journey[:out]
    #   true
    # when !current_journey[:in] && !current_journey[:out]
    #   true
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
    @history[-1][:out] = station
  end

  def completed_journeys
    @current_journey
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end


attr_reader :current_journey, :history

end
