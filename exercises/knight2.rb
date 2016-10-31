class Knight_Travels
	# => X and Y are INVERTED: @board[y][x]
	module Board
		def build_board
			@board = 8.times.map { Array.new(8, ".") }
		end

		def show_board
			puts (0..7).to_a.join(" ")
			puts ("A".."H").to_a.join(" ")
			@board.each_with_index { |line, i| puts "#{line.join(" ")} #{i}" }
		end
	end
	module Moving
		def move(ary,trail=false)		# => CALLED BY KNIGHT_MOVES
			trail ? @board[ary[1]][ary[0]] = "o" : @board[ary[1]][ary[0]] = "X"
		end

		def knight_moves(ary)
			kp = @knight_position
			move(kp[0],kp[1],true)
			@knight_position = ary
			move(ary[0],ary[1])
		end

		def moves_range(x,y,option)
			case option
				when 0 then return [x+=1, y-=2]
				# when 1 then return (x+=2, y-=1)
				# when 2 then return (x+=2, y+=1)
				# when 3 then return (x+=1, y+=2)
				# when 4 then return (x-=1, y+=2)
				# when 5 then return (x-=2, y+=1)
				# when 6 then return (x-=2, y-=1)
				# when 7 then return (x-=1, y-=2)
			end
		end
	end
	include Board
	include Moving

	def initialize
		build_board
		@knight_position = [3,4]
		move(@knight_position)
		# show_board
	end





end

horse = Knight_Travels.new
# horse.move(2,3,true)
# horse.knight_moves(2,3)
# horse.knight_moves(2,1)

horse.show_board