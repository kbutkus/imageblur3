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
      puts row.join
    end
  end


  def blur(distance)
    coordinates = []
    y = distance
    counter = 1
    counter_x = 1

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
        until counter > y
          until counter_x > y
          @array[row_coordinate + counter ][value_coordinate + (y - counter_x)] = 1 if @array[row_coordinate + counter ]
          @array[row_coordinate - counter ][value_coordinate + (y - counter_x)] = 1 if @array[row_coordinate - counter ][value_coordinate + (y - counter_x)]
          @array[row_coordinate + counter ][value_coordinate - (y - counter_x)] = 1 if @array[row_coordinate + counter ]
          @array[row_coordinate - counter ][value_coordinate - (y - counter_x)] = 1 if @array[row_coordinate - counter ][value_coordinate - (y - counter_x)]
          counter_x = counter_x + 1
          end
        @array[row_coordinate][value_coordinate + counter] = 1 if @array[row_coordinate][value_coordinate + counter]
        @array[row_coordinate][value_coordinate - counter] = 1                  
        counter = counter + 1
        counter_x = 1
        end
        counter = 1 
    end
        puts "Blurred Image"
         @array.each do |row|
        puts row.join
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