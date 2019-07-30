require 'open-uri'
file = open('http://www.gutenberg.org/files/11/11-0.txt')
text = file.read
text.gsub!(/-/, ' ')
words = text.split
cwords = []
words.each do |w|
  w.gsub!(/[,\?\.‘’“”\:;!\(\)]/, '')
  cwords &lt;&lt; w.downcase
end
words = cwords
words.sort!
whash = {}
words.each do |w|
  if whash[w].nil?
    whash[w] = 0
  end
  whash[w] += 1
end
whash = whash.sort_by { |k, v| v }.to_h
swords = words.sort_by do |el|
  el.length
end
lword = swords.last
whash.each do |k, v|
  puts "#{k.ljust(lword.length + 3 - v.to_s.length, '.')}#{v}"
end
