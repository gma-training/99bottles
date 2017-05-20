class Bottles
  def verse(number)
    <<-EOF
#{number} bottles of beer on the wall, #{number} bottles of beer.
Take one down and pass it around, #{number - 1} bottles of beer on the wall.
EOF
  end
end
