require 'ffi'
require 'watir'
require 'webdrivers'
require 'nokogiri'

browser = Watir::Browser.new
browser.goto 'https://adventofcode.com/2022/day/1/input'
parsed_page = Nokogiri::HTML(browser.html)

File.open("parsed.txt", "w") { |f| f.write "#{parsed_page}" }

browser.close
