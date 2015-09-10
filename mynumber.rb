class MyNumber
  def self.valid? number
    check_digit(number) == number.to_s[-1].to_i
  end

  def self.check_digit number
    return false if number.to_s.size != 12
    sigma = 0
    number.to_s.scan(/./).reverse.each_with_index do |n, idx|
      next if idx == 0
      sigma += n.to_i * (idx < 7 ? idx + 1 : idx - 5)
    end
    sigma % 11 <= 1 ? 0 : 11 - (sigma % 11)
  end
end
