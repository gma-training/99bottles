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

  def next
    Bottle.new(number - 1)
  end
end

class Bottles
  def verse(number)
    bottle = Bottle.new(number)
    <<-EOF
#{bottle} of beer on the wall, #{bottle} of beer.
Take #{bottle.pronoun} down and pass it around, #{bottle.next} of beer on the wall.
EOF
  end
end
