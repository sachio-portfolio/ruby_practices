module Baseball
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
      puts "背番号#{@uniform_number}番、#{@player}"
    end
  end
end

module Clock
  class Second
    def initialize(digits)
      @digits = digits
      puts "かかった時間は#{@digits}秒です"
    end
  end
end

Baseball::Second.new('Alice', 13)
Clock::Second.new(13)
