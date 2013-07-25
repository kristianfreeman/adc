require "adc/version"
require "nokogiri"
require "open-uri"
require "colorize"

module Adc
  def self.pull_statuses
    current = {}
    online = {}
    offline = {}

    doc = Nokogiri::HTML(open("https://developer.apple.com/support/system-status/"))

    statuses = doc.css('table.status-table td')

    statuses.each do |ret_stat|
      status = ret_stat.attributes["class"].value
      name = ret_stat.children.last.to_s.gsub(/<\/?[^>]*>/, "")
      name.gsub!("&amp;", "&") # omg haxxx
      current[name] = status
    end

    current.each do |k,v|
      if v == "online"
        online[k] = v
      elsif v == "offline"
        offline[k] = v
      end
    end

    puts "Online: ".green
    online.each do |k,v|
      puts "#{k}: #{v}".green
    end
    puts
    puts "Offline: ".red
    offline.each do |k,v|
      puts "#{k}: #{v}".red
    end
  end
end
