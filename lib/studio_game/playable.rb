module StudioGame

  module Playable
    def w00t
      @health += 15
      puts "#{@name} got wOOted!"
    end

    def blam
      @health -= 10
      puts "#{@name} got blammed!"
    end

    def strong?
      @health > 100
    end
  end

end
