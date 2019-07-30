require 'open-uri'
#file = open('http://www.gutenberg.org/files/11/11-0.txt')
file = open('http://www.textfiles.com/etext/NONFICTION/bfaut10.txt')
text = file.read
#text.gsub!(/-/, ' ').gsub!(/[\[\],\?\.‘’“”'"\:;!\(\)]/, '')
words = text.split
start = rand(words.count)
count = start
index_of_first_period = nil
loop do
  #print words[count] + ' '
  if words[count][-1] == '.'
    #puts "#{words[count]}"
    #puts
    index_of_first_period = count
    break
  end
  if count >= start + 100
    break
  end
  count += 1
end
new = index_of_first_period + 1
count = new
printed = 0
sentences = 0
loop do
  print words[count] + ' '
  printed += (words[count] + ' ').length
  if printed > 30
    print "\n"
    printed = 0
  end
  if words[count][-1] == '.' && count > 100
    index_of_first_period = count
    sentences += 1
    if sentences == 2
      break
    end
  end
  if count >= new + 100
    break
  end
  count += 1
end
puts
