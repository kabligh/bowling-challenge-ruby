class Frame

  STARTING_PINS = 10

  attr_reader :rolls, :remaining_pins

  def initialize(frame_num, previous_frame)
    @previous_frame = previous_frame
    @rolls = []
    @remaining_pins = STARTING_PINS
  end

  def roll(pins)
    if !played?
      @remaining_pins -= pins
      @rolls.push(pins)
    end
  end

  def played?
    @rolls.length == 2 || @remaining_pins == 0
  end

  def score
    @rolls.inject(0, :+)
  end

end
