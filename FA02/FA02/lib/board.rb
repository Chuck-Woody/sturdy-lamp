require "byebug"
class Board
    attr_reader :max_height

    def initialize(num_stacks, max_height)
        raise 'rows and cols must be >= 4' if num_stacks < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def self.build_stacks(num_stacks)
        return_stacks = Array.new(num_stacks) {Array.new()}
    end

    def add(token,index)


        if @stacks[index].length < self.max_height
            @stacks[index].push(token)
            return true
        elsif @stacks[index].length >= self.max_height
            return false
        end
    end
    
    def vertical_winner?(token)

        @stacks.any? do |sub_arr|
            
            sub_arr.all? do |ele|

                ele == token
            end && sub_arr.length == self.max_height
        end
    end

    def horizontal_winner?(token)
        i = 0 # row
        while i < max_height
        j = 0 
        row_win = true #column
            while j < @stacks.length

               if  @stacks[j][i] != token
                    row_win = false
               end
                j += 1
            end
            return row_win if row_win
            i += 1
        end
        row_win
    end

    def winner?(token)

        horizontal_winner?(token) || vertical_winner?(token)
    end

    def print
        @stacks.each { |stack| p stack }
    end
end
