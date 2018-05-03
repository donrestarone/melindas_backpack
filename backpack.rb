class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    # set up local variables used by rest of prepare method
    weather = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]

    # Ensure appropriate clothing is added to backpack
    default_items
    if weather == 'rainy'
      rainy_weather_items
    elsif weather == 'cold'
      cold_weather_items
    end
    # Ensure gym shoes are added to backpack if it's a gym day
    # Gotta get to the gym on Tuesdays and Thursdays. Wait a sec...
    if day_of_week == 'monday' || day_of_week == 'thursday'
      #add gym shoes to items
      gym_items
    end

    # Bring a packed lunch on all weekdays
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      pack_lunch
    end
  end

  def pack_lunch
    @items << 'packed lunch'
  end

  def gym_items
    @items << 'gym shoes'
  end

  def default_items
    @items << 'pants'
    @items << 'shirt'
  end

  def cold_weather_items
    @items << 'jacket'
  end

  def rainy_weather_items
    @items << 'umbrella'
  end

  # Prints a summary packing list for Melinda's backpack
  def summary_of_packing_list
    output = []
    information(output)
    pack_items(output)
    output.join("\n")
  end

  def information(array)
    array << "Melinda, here's your packing list!"
    array << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    array << ""
  end

  def pack_items(output)
    @items.each do |item|
      output << "- #{item}"
    end
  end
end
