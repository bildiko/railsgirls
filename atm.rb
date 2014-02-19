

def withdraw(amount)
  output = []
  note_values = [50, 20]
  num_fifties = 0
  num_twenties = 0
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  if ((amount < 40) and (amount != 20)) or (amount % 10 != 0)
    return false
  end
  (amount/200).times do
    num_fifties += 4
    amount -= 200
  end
  
  while amount > 0 do
    if ((amount - 50) % 20 == 0) or ((amount - 50) % 50 == 0) then 
      num_fifties += 1
      amount -= 50
    else
      while (amount % 50 != 0) do
        num_twenties += 1
        amount -= 20
        puts amount.to_s
      end
    end 
    puts amount.to_s
  end

  num_fifties.times do 
    output << 50
  end
  num_twenties do
    output << 20
  end

  # note_values.each do |nv|
  #   (amount/nv).times do
  #     output << nv
  #     amount -= nv
  #   end
  # end
  return output
end

# import required testing libraries
require 'minitest/spec'
require 'minitest/autorun'

# Below are the tests for automatically checking your solution.
# You need to replace these tests after each step.

describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [29, false],
    [135, false],
    [70, [50, 20]],
    [80, [20, 20, 20, 20]],
    [90, [50, 20, 20]],
    [120, [50, 50, 20]],
    [130, [50, 20, 20, 20, 20]],
    [160, [50, 50, 20, 20, 20]],
    [200, [50, 50, 50, 50]]
  ].each do |amount, expected|
    it "should return #{expected} when $#{amount} is withdrawn" do
      withdraw(amount).must_equal expected
    end
  end
end