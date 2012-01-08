Dir.entries('.').each do |file|
  File.rename($&, "0"+$&) if file =~ /^\d{2}\.rb$/
end
