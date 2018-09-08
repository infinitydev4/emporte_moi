module HomeHelper

  def show_num(num)
    i = 0
    nums = num.split("")
    numspace = nums.map do
      nums[i] + nums[i+1]
    end
    return numspace[0..4].join(' ')
  end

end
