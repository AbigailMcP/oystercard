require_relative 'station'
require_relative 'journey'

class Oystercard

LIMIT = 90
BALANCE = 0
MINIMUM_BALANCE = 1

  def initialize(balance: BALANCE, journey: Journey)
    @balance = balance
    @current_journey = journey.new
  end

  def top_up(amount)
    fail "Limit £#{LIMIT} exceeded" if full?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail 'below minimum balance' if empty?
    #@current_journey = Journey.new
    deduct(@current_journey.check_previous_journey)
    @current_journey.start(station)
  end

  def touch_out(station)
    #raise "Penalty fare: No touch in" if deduct(@current_journey.fare) == 6
    @current_journey.finish(station)
    deduct(@current_journey.fare)
    @current_journey = Journey.new
  end

  # private

  attr_reader :balance, :entry_station, :current_journey

  def deduct(amount)
    @balance -= amount
  end

  def full?(amount)
    @balance + amount > LIMIT
  end

  def empty?
    @balance < MINIMUM_BALANCE
  end

end
