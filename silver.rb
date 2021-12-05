score = [["kobayashi", 86],["murata", 54],["azuma", 72]]
score = score.sort {|a,b| -a[1] <=> -b[1]  }
p score

cooking = "Rice\nBread\rPasta\n\r"
p cooking.chomp

a = [2, 3, 6, 8, 12].map{ |d| d / 3 }
print a

student_1={:name => 'sato', :club => 'tennis'}
student_2={:name => 'ito', :club => 'football'}
p student_1.merge(student_2)

score = 50
battle = score < 70 ? "勝ち" : "負け"
p battle

true & a = "We"
false | b = "are"
2 == 1 && c = "Ruby"
5 > 3 || d = "Engineer"
p = a + b + c + d

mountain = {"fujisan" => 3776, "asosan" => 1592, "tateyama" => 3015}
p mountain.length

def teacher(a, *b, c)
  p  [a, b, c]
end

school = teacher("ito", "kato", "sato", "eto")
p school

p 2 * 0xBF

puts Integer.superclass

ope = "wakuwaku" == "waku" * 2 || "Rubyは楽しい"
print ope

color = "red\nblue\ngreen\nblack\nwhite\n"
s = color.each_line {|i| p i.chomp!}
print s

p Time.now.to_i

lit = "weloveRubyONrails"[/^[A-Z][^A-Z]+/]
print lit

p "aa".upto("ae") {|s| print s, ',' }

p sprintf("%#b", 20)
p sprintf("%#o", 20)
p sprintf("%#x", 20)

a = ["1", "3", "5", "2", "3"]
a.delete_at(3)
p a

h = {:name => 'sato', :club => 'tennis'}.fetch(:name, 'error')
print h

one = [1, 3, 5]
two = [2, 4, 6]
p one.zip(two)

music = "Jazz\nRock\rTechno\n\r!"
music.chop
p music

pass = [8, 9, 2, 1] | [2, 7, 4, 1].sort
p pass
