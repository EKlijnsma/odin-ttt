class Board
  attr_accessor :state
  
  def initialize
    self.state = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]  
  end

  def process_move(move, player_symbol)
    # Game board is 1-9 for human convenience
    # When zero-indexed, we can utilize integer division and modulo to 
    # get the row and column values of a given move. 
    row = (move - 1) / 3
    col = (move - 1) % 3
    self.state[row][col] = player_symbol
  end

  def to_s
    print '-' * 15
    puts
    for row in self.state
        for cell in row
            print "| #{cell} |"
        end
        puts
        print '-' * 15
        puts
    end
  end
end