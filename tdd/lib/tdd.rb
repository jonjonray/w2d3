

def my_uniq(array)
  array.reduce([]) do |acc,ele|
    if !acc.include?(ele)
      acc << ele
    else
      acc
    end
  end
end

def two_sum(array)
  result = []

  array.each_with_index do |el, i|
    (i + 1...array.length).each do |j|
      result << [i, j] if el + array[j] == 0
    end
  end

  result
end


def my_transpose(array)
  result = []
  array.each_with_index do |el, i|
    column = []
    el.each_index do |j|
      column << array[j][i]
    end
    result << column
  end
  result
end

def stock_picker(array)
  result = []

  array.each_with_index do |el, i|
    j = i + 1
    while j < array.length
      current_profit = array[j] - el
      best_profit = array[result[1]] - array[result[0]] if !result.empty?
      if result.empty?
        result.concat([i,j])
      elsif current_profit > best_profit
        result = [i,j]
      end
      j+= 1
    end
  end
  result
end
