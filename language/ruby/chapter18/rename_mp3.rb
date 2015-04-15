#!/usr/bin/ruby 

require "fileutils"

def ren(path) 
  Dir.glob("#{path}/*.mp3").each do |name| 
    process_file(name)
  end
end

def process_file(name) 
  filename = File.basename(name)
  filename =~ /(.*)(\d.*)_.*(\.mp3)/
  FileUtils.mv(name, File.join(File.dirname(name), $2 + $3))
end

ren("/home/aries/Music/LuoJi")


=begin
/home/aries/Music/LuoJi/罗辑思维第三季第7期：统一是怎样炼成的_鸿新网www.hhxin.com整理.mp3
/home/aries/Music/LuoJi/罗辑思维第三季第4期：谁绑架了团结_鸿新网www.hhxin.com整理.mp3
/home/aries/Music/LuoJi/罗辑思维第三季第2期：大清帝国的生死时速_鸿新网www.hhxin.com整理.mp3
/home/aries/Music/LuoJi/罗辑思维第三季第6期：人类灭绝的一种可能_鸿新网www.hhxin.com整理.mp3
/home/aries/Music/LuoJi/罗辑思维第三季第3期：坏国王的遗产_鸿新网www.hhxin.com整理.mp3
/home/aries/Music/LuoJi/罗辑思维第三季第5期：秦始皇在隐瞒什么_鸿新网www.hhxin.com整理.mp3
/home/aries/Music/LuoJi/罗辑思维第三季第1期：大门口的野蛮人_鸿新网www.hhxin.com整理.mp3

/home/aries/Music/LuoJi/3期：坏国王的遗产.mp3
/home/aries/Music/LuoJi/4期：谁绑架了团结.mp3
/home/aries/Music/LuoJi/1期：大门口的野蛮人.mp3
/home/aries/Music/LuoJi/2期：大清帝国的生死时速.mp3
/home/aries/Music/LuoJi/7期：统一是怎样炼成的.mp3
/home/aries/Music/LuoJi/5期：秦始皇在隐瞒什么.mp3
/home/aries/Music/LuoJi/6期：人类灭绝的一种可能.mp3

=end
