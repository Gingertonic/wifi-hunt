#Wifi-Hunt's CLI

class WifiHunt::CLI
  attr_accessor :countries

  def call
    puts   "Hi there! Are you looking for some WiFi goodness?"
    puts "If you came here by mistake, just type exit!"
    continue
  end

  def continue
    puts ""
    puts "Here are the countries we currently have infomation about."
    puts ""
    list_states
    request_state
  end

  def list_states
    @countries = WifiHunt::Country.all
    @countries.each.with_index(1) {|state, i| puts "#{i}. #{state}"}
  end

  def request_state
    input = ""
    while input != "exit"
      puts ""
      puts "Where shall we go this time? Enter the state's name or number..."
      puts "To see the list again type 'list' or if you're all done, 'exit'"
      input = gets.strip.downcase
      puts ""
      if input.to_i > 0
        puts "Info about #{@countries.each.with_index(1).find{|state, i| i == input.to_i}[0]}"
      elsif @countries.find{|state| state.downcase == input}
        puts "Info about #{@countries.find{|state| state.downcase == input}}"
      elsif input == "list"
        list_states
      elsif input =="exit"
        goodbye
      else
        puts "Sorry, what was that?"
      end
    end
  end

  def goodbye
    puts "Bye! Happy connecting!"
  end
end
