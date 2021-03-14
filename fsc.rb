# frozen_string_literal: true

require 'pry'

class C
  attr_accessor :mpm, :diameter, :max_rpm, :max_feed_rate, :num_flutes, :chipload

  def initialize
    @mpm = 60
    @diameter = 6
    @max_rpm = 10_000
    @max_feed_rate = 2000
    @num_flutes = 2
    @chipload = 0.1

    puts("Vars:\n@mpm\n@diameter\n@max_rpm\n@max_feed_rate\n@num_flutes\n@chipload")
  end

  def print
    puts("MPM:              #{@mpm}m/min")
    puts("Chipload:         #{@chipload}mm")
    puts("Tool Diameter:    #{@diameter}mm")
    puts("Tool Flute Count: #{@num_flutes}")
    puts("Max RPM:          #{@max_rpm}rpm")
    puts("Ideal RPM:        #{rpm.round(2)}rpm")
    puts("Max FeedRate:     #{@max_feed_rate}mm/s")
    puts("Ideal FeedRate:   #{feedrate(rpm).round(2)}mm/s")
    puts("\nAchievable feed and speed:")
    feednspeed
  end

  def rpm
    (1000 * @mpm) / (Math::PI * @diameter)
  end

  def feedrate(r)
    r * @num_flutes * @chipload
  end

  def feednspeed
    r = rpm
    r = @max_rpm if r > @max_rpm
    f = feedrate(r)
    if f > @max_feed_rate
      mul = @max_feed_rate / f
      r *= mul
    end
    f = feedrate(r)

    puts("RPM:       #{r.round(2)}rpm")
    puts("FeedRate:  #{f.round(2)}mm/s")
    puts("\n\n")
  end
end

job = C.new
Pry.start(job)
