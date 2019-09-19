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

# If not, look for wins in grandchildren
possible_moves.each do |move|
    children = get_children(move)
    unless children.empty?
        #Do we need to loop below here?
        grandchildren = get_children(move)[0][:children] #where we dig down a level
        unless grandchildren.empty?
            highest_scoring_grandchild = get_highest_scoring_child(grandchildren)
            move[:score] += highest_scoring_grandchild[:score]
        end
    end
end

 for (i = 0; i < children.length; i++)
    grandchildren = get_children(move)[i][:children] #where we dig down a level
        unless grandchildren.empty?
            highest_scoring_grandchild = get_highest_scoring_child(grandchildren)
            move[:score] += highest_scoring_grandchild[:score]
        end
 end


  children[:children].each do ||
    puts 
    x += 1
  end

  s.each do |sub_array|
    sub_array.each do |item|
        puts item
    end
  end

  s.each { |x| x.each { |y| puts y } }


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

# def self.best_position(possible_moves)
#     unless children.empty?      
#       best_position(possible_moves)
#     end
#   end

# class Minimax
#     def self.best_position(possible_moves)
#         return nil if possible_moves.empty?

#         # Checking if there are wins in top level
#         sorted_possible_moves = sort_moves_by_score(possible_moves)
#         winning_position = sorted_possible_moves[-1][:position]
#         return winning_position if check_level_for_win?(sorted_possible_moves)

#         # If not, look for wins in children level
#         possible_moves.each do |move|
#             children = get_children(move)
#             unless children.empty? 
#                 # puts "CHILDREN"
#                 # puts children
#                 # puts "MOVE"
#                 # puts move
#                 highest_scoring_grandchild = get_highest_scoring_child(grandchildren)
#                 move[:score] += highest_scoring_grandchild[:score]
#             end
#         end

#         sorted_possible_moves = sort_moves_by_score(possible_moves)
#         winning_position = sorted_possible_moves[-1][:position]
#         return winning_position if check_level_for_win?(sorted_possible_moves)
                
#                 # If not, look for wins in grandchildren
#                 grandchildren = get_children(move)[0][:children] #where we dig down a level
#                 unless grandchildren.empty?
#                     # puts "GRANDCHILDREN"
#                     # puts get_children(move)[0][:children]
#                     highest_scoring_grandchild = get_highest_scoring_child(grandchildren)
#                     move[:score] += highest_scoring_grandchild[:score]
#                 end
#             end
#         end

#         sorted_possible_moves = sort_moves_by_score(possible_moves)
#         winning_position = sorted_possible_moves[-1][:position]
#     end

#     def self.sort_moves_by_score(array_of_hashes)
#         array_of_hashes.sort_by { |hash| hash[:score] }
#     end

#     def self.get_highest_scoring_child(array_of_children)
#         sorted_children = sort_moves_by_score(array_of_children)
#         sorted_children[-1]
#     end

#     def self.check_level_for_win?(sorted_possible_moves)
#         sorted_possible_moves[-1][:score] > 0
#     end

#     def self.get_children(move)
#         children_array = move[:children]
#             unless children_array.empty?
#                 return children_array
#             end
#         []
#     end
# end

