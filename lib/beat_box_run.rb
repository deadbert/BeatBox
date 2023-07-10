require_relative 'beat_box'
require_relative 'linked_list'
require_relative 'node'

puts "Welcome to beat_box"

on = true

bb = BeatBox.new()

while on do
  puts "Type: 'set speed' to adjust speed of playback"
  puts "Type: 'set voice' to set voice for playback"
  puts "Type: 'add beats' to add words to be beat boxed"
  puts "Type: 'play' to hear your beats"
  puts "Type: 'Off to exit the program"
  input = gets.chomp

  if input == 'set speed'
    puts "type desired speed as integer or 'reset' to set default"
    speed = gets.chomp
    if speed == 'reset'
      bb.reset_rate
    else
    bb.rate = speed
    end
  elsif input == 'set voice'
    puts "type desired voice or 'reset' to set to default"
    puts "accepted voices: Daniel, Samantha, Fred, Boing"
    voice = gets.chomp
    if voice == 'reset'
      bb.reset_voice
    else
    bb.voice = voice
    end
  elsif input == 'add beats'
    puts "Type the words you want beat boxed"
    puts "accepted words: tee, dee, deep, bop, boop, la, na,
    shu, woo, ditt, doo, hoo, tee, wee"
    words = gets.chomp
    bb.append(words)
  elsif input == 'play'
    bb.play
  elsif
    input == 'Off'
    on = false
  else
    puts "unrecognized command"
  end

end
