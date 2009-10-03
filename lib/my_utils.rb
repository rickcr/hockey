module MyUtils
  #include Time
  
  def seconds_to_time seconds
    #if you want hours, add seconds/3600 first
    #one below justifies, both minutes and seconds
    #[seconds/60 % 60, seconds % 60].map{ |t| t.to_s.rjust(2,'0') }.join(':')
    #str = "#{(seconds/60 % 60).to_s}:#{(seconds % 60).to_s.rjust(2,'0')}"  
    #Time.at(seconds).gmtime.strftime('%R:%S')
    [ seconds / 60 % 60, seconds % 60 ].map{ |t| t.to_s.rjust(2, '0') }.join(':') 
  end
  
  def time_to_seconds time_display  
     seconds = time_display.split(':').inject(0){|sum, timeunit| sum = sum * 60 + timeunit.to_i} 
     #crapp below: !!
     # time = time_display.split(":")  
     #      seconds = 0 
     #      modifiers = [ 1, 60, 360  ]
     #      time.each_with_index do | t, i |
     #         seconds = seconds + ( t.to_i * modifiers[time.length-1 - i] ) 
     #      end
     #      return seconds
  end
end