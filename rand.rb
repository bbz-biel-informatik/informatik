s = ARGV[0].to_i
t1 = ARGV[1].to_i
t2 = ARGV[2].to_i

num = rand(4) + 1

for i in 1..num do
  min = rand(90) + 1
  hg = rand(2)
  poff = rand(5)
  if hg == 0
    p = (t1-1)*5+1 + poff
  else
    p = (t2-1)*5+1 + poff
  end
  puts "INSERT INTO tore (spiel_id, minute, spieler_id) VALUES (#{s}, #{min}, #{p});"
end

