class Oystercard

attr_reader :balance, :in_journey

LIMIT = 90
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Limit £#{LIMIT} exceeded" if full?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def full?(amount)
    @balance + amount > LIMIT
  end

end
