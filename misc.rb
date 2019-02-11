(1..1000).inject(:+) # Summe aus Range
[49, 58, 82, 90].partition { |n| n > 60 } # Gruppieren
(z ||= []) << 'test' # 'z' lazy initialisieren
{first_name: 'Max'}[:last_name].downcase rescue "Musertmann"
assert "[%s]" % "Ruby, Ruby, Ruby" == '[Ruby, Ruby, Ruby]' # sprintf
