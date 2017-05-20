class Bottle < Struct.new(:number)
  def to_s
    case number
    when 0
      'no more bottles'
    when 1
      '1 bottle'
    else
      "#{number} bottles"
    end
  end

  def pronoun
    case number
    when 1
      'it'
    else
      'one'
    end
  end

  def action
    case number
    when 0
      'Go to the store and buy some more'
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def next
    next_number = (number == 0) ? 99 : number - 1
    Bottle.new(next_number)
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
