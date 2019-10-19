require 'open-uri'

def to_filename(name)
  name.downcase.gsub(' ','_')
end

def record_group(n, group)
  html = File.open("#{to_filename(n)}.html","w")
  html.write("<h2>#{n}</h2>")
  html.write('<div class="figures" markdown="1">')

  group.each_pair do |name, args|
    puts name
    moves = args[0]
    arrows = args[1]
    filename = to_filename(name)+".svg"

    url = "http://cube.crider.co.uk/visualcube.php?fmt=svg&pzl=3&view=plan&"+
      "fd=ununnnunurnrrrrrrrfnfffffffdddddddddlnlllllllbnbbbbbbb&ac=white&"+
      "case=#{moves}&arw=#{arrows}"

    response = open(url).read
    File.write("images/#{filename}", response)

    nice_moves = moves.gsub("'","′")

    html.write("<p><img src='images/#{filename}'><br>#{moves}</p>")
  end

  html.write('</div>')
end

record_group('CFOP OLL',
  'CMLL U 3a' => ["R2 D R' U2 R D' R' U2 R'", 'U2U8,U8U2'],
  'CMLL L 5a' => ["R' F R B' R' F' R B", 'U6U8,U8U6'],
  'CMLL T _' => ["B' R' F R B R' F' R", 'U2U8,U8U2'],
)

record_group('CMLL Pi',
  'CMLL Pi 1' => ["F R U R' U' R U R' U' F'", ''],
)

record_group('CMLL U',
  'CMLL U _' => ["F R U R' U' F'", 'U2U6,U6U2'],
)

exit
record_group('CMLL S',
  "CMLL S 1" => ["R U R' U R U2 R'", ''],
  "CMLL S 2" => ["L' U2 L U2 L F' L' F", 'U0U2,U2U0'],
  "CMLL S 3" => ["F R' F' R U2 R U2 R'", 'U2U8,U8U2'],
  "CMLL S 4" => ["U' R U R' U R U' R D R' U' R D' R2", 'U6U8,U8U6'],
  "CMLL S 5" => ["R U' L' U R' U' L", 'U0U6,U6U0'],
  "CMLL S 6" => ["U2 R U R' U R' F R F' R U2 R'", 'U2U6,U6U2']
)

record_group('CMLL H',
  'CMLL H 1' => ["R U2 R' U' R U R' U' R U' R'"],
  'CMLL H 2' => ["U' R U R' U R U L' U R' U' L", 'U6U8,U8U6'],
  'CMLL H 3' => ["U R U2 R2 F R F' U2 R' F R F'", 'U0U6,U6U0'],
  'CMLL H 4' => ["F R U R' U' R U R' U' R U R' U' F'", 'U2U6,U6U2']
)
