require_relative 'oystercard'
# => Knows everything about a journey
class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize()
    @history = [{:in => nil, :out => nil}]
    @current_journey = {}
  end

  def complete?

    !!@current_journey[:in] && !!@current_journey[:out]

    # !!@history[-1][:in] && !!@history[-1][:out]
    # case
    # when !!@history[-1][:in] && !@history[-1][:out]
    #   false
    # when !@history[-1][:in] && !!@history[-1][:out]
    #   false
    # else
    #   true
    # end

  end

  def start(station)
    @current_journey = {:in => station, :out => nil}
    @history << @current_journey
  end

  def finish(station)
    if complete?
      @current_journey = {:in => nil, :out => station}
    else
      @current_journey[:out] = station
    end
    @history << @current_journey
  end

  def check_previous_journey
    @current_journey = @history[-1]
    complete? ? PENALTY_FARE : 0
  end

  # def completed_journeys
  #   @current_journey
  # end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end


attr_reader :current_journey, :history

end
