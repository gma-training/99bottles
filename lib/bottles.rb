class Bottle
  class NoMoreStrategy < Struct.new(:number)
    def action
      'Go to the store and buy some more'
    end

    def to_s
      'no more bottles'
    end

    def next
      Bottle.new(99)
    end
  end

  class LastBottleStrategy < Struct.new(:number)
    def action
      "Take it down and pass it around"
    end

    def to_s
      '1 bottle'
    end

    def next
      Bottle.new(number - 1)
    end
  end

  class MultipleBottlesStrategy < Struct.new(:number)
    def action
      "Take one down and pass it around"
    end

    def to_s
      "#{number} bottles"
    end

    def next
      Bottle.new(number - 1)
    end
  end

  extend Forwardable

  def_delegators :@strategy, :action, :next, :to_s

  attr_reader :number

  def initialize(number)
    @number = number
    @strategy = case number
                when 0
                  NoMoreStrategy.new(number)
                when 1
                  LastBottleStrategy.new(number)
                else
                  MultipleBottlesStrategy.new(number)
                end
  end
end

class Bottles
  def verse(number)
    bottle = Bottle.new(number)
    <<-EOF
#{bottle.to_s.capitalize} of beer on the wall, #{bottle} of beer.
#{bottle.action}, #{bottle.next} of beer on the wall.
EOF
  end

  def verses(from, to)
    (to..from).to_a.reverse.map { |n| verse(n) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end
