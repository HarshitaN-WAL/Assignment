class TicTac
	attr_accessor :matrix,:filled,:rows,:x,:y

	def initialize
		self.filled={0=>[nil,nil,nil],1=>[nil,nil,nil],2=>[nil,nil,nil]}
		self.matrix=[[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
		self.rows=0
	 end

	def fill_x(x:,y:)
		#puts "filling"
		matrix[x][y]="x"

		update=filled[x][y]="fill"
		puts "-"
		puts matrix
	end
	def fill_o(x:,y:)
		#puts "filling"
		matrix[x][y]="0"

		update=filled[x][y]="fill"
		puts "-"
		puts matrix
	end
	def check_free(x:,y:)
	 	if filled[x][y]=="fill"
	 		return false
	 	end
	 	return true
	end
	def check_hor_x
		for i in (0..2)
			if matrix[i].all?{|x| x=="x"}
				puts "WIN"
				return "WIN"
			end
		end

	end
	def check_hor_0
		for i in (0..2)
			if matrix[i].all?{|x| x=="0"}
				puts "WIN"
				return "WIN"
			end
		end

	end
	def check_ver_x
		for i in (0..2)
			t=0
			for j in (0..2)
				if (matrix[j][i]=="x")
					t=t+1
				end
			end
			if(t==3)
				puts "WIN"
				return "WIN"
			end
		end
	end
	def check_ver_0
		for i in (0..2)
			t=0
			for j in (0..2)
				if (matrix[j][i]=="0")
					t=t+1
				end
			end
			if(t==3)
				puts "WIN"
				return "WIN"
			end
		end
	end
	def check_diagonal_x
		if matrix[0][0]=="x" && matrix[0][0]==matrix[1][1] && matrix[1][1]==matrix[2][2]
			puts "WIN"
			return "WIN"
		end
		if matrix[0][2]=="x" && matrix[0][2]==matrix[1][1] && matrix[1][1]==matrix[2][0]
			puts "WIN"
			return "WIN"
		end
	end
	def check_diagonal_0
		if matrix[0][0]=="0" && matrix[0][0]==matrix[1][1] && matrix[1][1]==matrix[2][2]
			puts "WIN"
			return "WIN"
		end
		if matrix[0][2]=="0" && matrix[0][2]==matrix[1][1] && matrix[1][1]==matrix[2][0]
			puts "WIN"
			return "WIN"
		end

	end


	def generate_x
		row=[0,1,2]
		return row.sample
	end
	def generate_y
		col=[0,1,2]
		return col.sample
	end
end
t=TicTac.new
while t.rows<9 do 
	
	if t.check_hor_x=="WIN"
		puts "WINNER is Player"
		break
	end
	if t.check_ver_x=="WIN"
		puts "WINNER is Player"
		break
	end
	if t.check_diagonal_x=="WIN"
		puts "WINNER is Player"
		break
	end
	# if t.check_diagonal_0=="WIN"
	# 	puts "WINNER is COMPUTER"
	# 	break
	# end
	
	    while true do
			x=t.generate_x
			y=t.generate_y
			if t.check_free(x:x,y:y)
				t.rows=t.rows+1
				puts "computer"
				t.fill_o(x:x,y:y)
				puts t.rows				
				break
			end
		end
		if t.rows==9
			puts "ITs a TIE" 
			break
		end
	if t.check_hor_0=="WIN"
		puts "WINNER is COMPUTER"
		break
	end
	if t.check_ver_0=="WIN"
		puts "WINNER is COMPUTER"
		break
	end

	
		while true do
		 	puts "enter row "
			x=gets.chomp.to_i
			puts "enter col "
			y=gets.chomp.to_i
			if t.check_free(x:x,y:y)
				t.rows=t.rows+1
				puts "player"
				t.fill_x(x:x,y:y)
				puts t.rows
				break
			end

		end

end





