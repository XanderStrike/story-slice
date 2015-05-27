#!/Users/alexanderstandke/.rvm/rubies/ruby-2.1.5/bin/ruby

###
# Super awesome calculator
#   Alexander Standke
#   Adam Wells
#   Appfolio, Inc.

TAX_RATES = {ut: 0.0685,
             nv: 0.08,
             tx: 0.0625,
             al: 0.04,
             ca: 0.0825}

def calculate_tax total, state
  rate = TAX_RATES[state.to_sym].to_f
  if rate > 0
    (total * rate)
  else
    0
  end
end

def get_number text
  while true
    print "#{text}: "
    num = gets.to_f
    if num == 0
      puts 'Error: Not a Number'
    elsif num < 0
      puts 'Error: Must be greater than zero'
    else
      return num
    end
  end
end

def get_state
  gets[0..1].chomp.downcase
end

def round float
  float.round(2)
end

# output
puts 'Ricky Bobby Inc.'
puts 'If ya aint first youre last!'
puts '='*30


price = get_number 'Price'
quantity = get_number 'Quantity'
total = quantity * price

puts "Subtotal: #{total}"


# discount - i'm not proud of this
if total > 50000
  total = total * 0.85
elsif total > 10000
  total = total * 0.90
elsif total > 7000
  total = total * 0.93
elsif total > 5000
  total = total * 0.95
elsif total > 1000
  total = total * 0.97
end

puts "Discounted total: #{ total }"

# tax
print 'State: '
state = get_state

total += calculate_tax(total, state)

puts "Total after #{ state.upcase } tax: $#{ round(total) }"
