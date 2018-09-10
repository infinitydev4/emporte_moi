module HomeHelper

  def show_num(num)
    i = 0
    nums = num.split("")
    numspace = ""
    5.times do
      numspace << nums[i] + nums[i+1] + " "
      i += 2
    end
    return numspace[0..13]
  end

end
