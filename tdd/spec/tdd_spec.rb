require "rspec"
require "tdd"


describe "my_uniq" do
  it "returns an empty array if input is an empty array" do
    expect(my_uniq([])).to be_empty
  end

  it "removes duplicates from array" do
    array1 = [1,2,2,3,5,4,7,1]
    expect(my_uniq(array1)).to eq([1,2,3,5,4,7])
  end

  it "returns the same array if there are no duplicates" do
    array2 = [1,2,3,4,5]
    expect(my_uniq(array2)).to eq(array2)
  end

end

describe "two_sum" do
  it "returns an empty array if no numbers sum to zero" do
    expect(two_sum([1, 2, 3])).to be_empty
  end

  it "returns indices of numbers that sum to zero" do
    array = [-1, 2, 1]
    expect(two_sum(array)).to eq([[0, 2]])
  end

  it "returns indices in correct order" do
    array2 = [-1, 1, 3, 5, -3]
    expect(two_sum(array2)).to eq([[0, 1], [2, 4]])
  end
end

describe "my_transpose" do
  it "returns transposed arrays" do
    array = [
      [1, 1, 1],
      [2, 2, 2],
      [3, 3, 3]
    ]
    expect(my_transpose(array)).to eq([[1, 2, 3], [1, 2, 3], [1, 2, 3]])
  end

  it "returns transposed 5x5 array" do
    array2 = [
              [1,1,1,1,1],
              [2,2,2,2,2],
              [3,3,3,3,3],
              [4,4,4,4,4],
              [5,5,5,5,5]
            ]
    expect(my_transpose(array2)).to eq([[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]])
  end

  it "returns transposed array with differing values" do
    array3 = [
              [4,8,9],
              [6,1,2],
              [0,3,2]
              ]
    expect(my_transpose(array3)).to eq([[4,6,0],[8,1,3],[9,2,2]])

  end
end

describe "stock_picker" do
  it "return most profitable pair" do
    array = [4, 7, 20, 13, 1]
    expect(stock_picker(array)).to eq([0, 2])
  end

  it "return most profitable pair for a downward trend" do
    array2 = [15, 12, 10, 7, 1]
    expect(stock_picker(array2)).to eq([1, 2])
  end

  it "returns first two prices if difference is the same" do
    array3 = [4, 5, 4, 5, 4]
    expect(stock_picker(array3)).to eq([0, 1])
  end
end
