class Group < Struct.new(:number)
  def to_s
    (number == 1) ? "#{number} bottle" : "#{number} bottles"
  end
end

class Bottles
  def verse(number)
    <<-EOF
#{Group.new(number)} of beer on the wall, #{Group.new(number)} of beer.
Take one down and pass it around, #{Group.new(number - 1)} of beer on the wall.
EOF
  end
end
