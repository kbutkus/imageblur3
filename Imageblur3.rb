class Image
  #accessor enables read and write, storing variable
  attr_accessor :array

  #intiates the command 
  def initialize (array)
    @array = array
  end


  def output_image
    puts "Original Image"
    @array.each do |row|
      puts row.join(" ")
      puts " "
    end
  end


  def blur(distance)
    coordinates = []
    y = distance + 1
    i = 1
    i_x = 1

    @array.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        if value == 1
          coordinates << [row_index, value_index]
        end
      end
    end       

    coordinates.each do |coordinate|
      row_coordinate = coordinate[0]
      value_coordinate = coordinate[1]
      (0...y).each do |i|
        (0...y-i).each do |j|
          @array[row_coordinate + i][value_coordinate + j] = 1 if row_coordinate  + i < @array.length and value_coordinate + j < @array[row_coordinate + i].length
          @array[row_coordinate - i][value_coordinate + j] = 1 if row_coordinate - i >= 0 and value_coordinate + j < @array[row_coordinate - i].length 
          @array[row_coordinate + i][value_coordinate - j] = 1 if row_coordinate  + i < @array.length and value_coordinate - j >= 0
          @array[row_coordinate - i][value_coordinate - j] = 1 if value_coordinate - j >= 0 and row_coordinate - i > 0
        end
      end
    end
    puts "Blurred Image"
    @array.each do |row|
      puts row.join(" ")
      puts " "
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1]
])

image.output_image
image.blur(2)