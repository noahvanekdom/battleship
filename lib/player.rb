###### THIS IS A TEMPORARY FILE DESCRIBING PLAYER INPUT FLOW ########


print @player_board.render
puts "Enter the squares for the Cruiser (3 consecutive spaces -- not diagonal!):"
cruiser_placement_input = gets.chomp.upcase # ( do we need a split here) #STDIN? #if valid placement, place cruiser
if @player_board.valid_placement?(@player_cruiser, cruiser_placement_input)
    @player_board.place(@player_cruiser, cruiser_placement_input)
    print @player_board.render(true)         #print current player_board with cruiser
else #if not valid placement THIS LOOP RUNS FOREVER
    validity = false
    while validity != true
        puts "Those are invalid coordinates. Please try again:"
        cruiser_placement_input = gets.chomp.upcase # split #ARGF? #STDIN?
        validity = @player_board.valid_placement?(@player_cruiser, cruiser_placement_input)
    end
    @player_board.place(@player.cruiser, cruiser_placement_input)
    print @player_board.render(true)
end

puts "Enter the squares for the Submarine (2 spaces):"
sub_placement_input = gets.chomp.upcase #split? STDIN? ARGF?
if @player_board.valid_placement?(@player_submarine, sub_placement_input)
    @player_board.place(@player_submarine, sub_placement_input)
    print @player_board.render(true)
else
    validity = false
    while validity != true
        puts "Those are invalid coordinates. Please try again:"
        sub_placement_input = gets.chomp.upcase #split? ARGF? STDIN?
        validity = @player_board.valid_placement?(@player_submarine, sub_placement_input)
    end
    @player_board.place(@player_submarine, sub_placement_input)
    print @player_board.render(true)
end
