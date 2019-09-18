def return_kids_highest_score_one_level(array_of_moves)
    array_of_moves.each do |move|
        children_array = return_kids()
        unless children_array.empty?
            highest_scoring_child = get_highest_scoring_child(children_array)
            move[:score] += highest_scoring_child[:score]
        end
        return move[:score]
    end
end

def self.return_children(move)
    children_array = move[:children]
        unless children_array.empty?
            return children_array
        end
    end
end

def self.check_level_for_win?(sorted_possible_moves)
    sorted_possible_moves[-1][:score] > 0
end
