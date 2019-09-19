class Minimax
    def self.best_position(possible_moves)
        return nil if possible_moves.empty?

        # Checking if there are wins in top level
        sorted_possible_moves = sort_moves_by_score(possible_moves)
        winning_position = sorted_possible_moves[-1][:position]
        return winning_position if check_level_for_win?(sorted_possible_moves)

        #while check_level_for_win?(sorted_possible_moves) == false
        #     sorted_possible_moves.each do |move|

        #     end
        # end

        # If not, look for wins in children
        possible_moves.each do |move|
            children = get_children(move) #children is an array
            unless children.empty?
                highest_scoring_child = get_highest_scoring_child(children)
                move[:score] += highest_scoring_child[:score]
            end
        end

        sorted_possible_moves = sort_moves_by_score(possible_moves)
        winning_position = sorted_possible_moves[-1][:position]
        return winning_position if check_level_for_win?(sorted_possible_moves)

        # If not, look for wins in grandchildren
        possible_moves.each do |move|
            children = get_children(move)
            unless children.empty? 
                # puts "CHILDREN"
                # puts children
                puts "MOVE"
                puts move
                grandchildren = get_children(move)[0][:children] #where we dig down a level
                unless grandchildren.empty?
                    # puts "GRANDCHILDREN"
                    # puts get_children(move)[0][:children]
                    highest_scoring_grandchild = get_highest_scoring_child(grandchildren)
                    move[:score] += highest_scoring_grandchild[:score]
                end
            end
        end

        sorted_possible_moves = sort_moves_by_score(possible_moves)
        winning_position = sorted_possible_moves[-1][:position]
    end

    def self.sort_moves_by_score(array_of_hashes)
        array_of_hashes.sort_by { |hash| hash[:score] }
    end

    def self.get_highest_scoring_child(array_of_children)
        sorted_children = sort_moves_by_score(array_of_children)
        sorted_children[-1]
    end

    def self.check_level_for_win?(sorted_possible_moves)
        sorted_possible_moves[-1][:score] > 0
    end

    def self.get_children(move)
        children_array = move[:children]
            unless children_array.empty?
                return children_array
            end
        []
    end
end

describe Minimax do
    it "returns nil when there's no possible moves" do
        possible_moves = []
        expect(Minimax.best_position(possible_moves)).to eq(nil)
    end

    it "returns position when there's one possible move" do
        possible_moves = [ { position: 1, children: [], score: 0 } ]
        expect(Minimax.best_position(possible_moves)).to eq(1)
    end

    it "returns best position when there's two possible moves" do
        possible_moves = [ 
                            { position: 1, children: [], score: 0 },
                            { position: 2, children: [], score: 10 } 
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(2)
    end

    it "returns best position when there's three possible moves" do
        possible_moves = [ 
                            { position: 1, children: [], score: 0 },
                            { position: 2, children: [], score: 10 },
                            { position: 3, children: [], score: -10 }  
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(2)
    end

    it "returns right most position when there's three equal score moves" do
        possible_moves = [ 
                            { position: 1, children: [], score: 0 },
                            { position: 2, children: [], score: 0 },
                            { position: 3, children: [], score: 0 }  
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(3)
    end

    it "returns position with greatest score from children example-1" do
        possible_moves = [ 
                            { position: 2, children: [ 
                                                     { position: 7, children: [], score: 10 },
                                                    ], score: 0 
                            },
                            { position: 1, children: [], score: 0 }
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(2)
    end

    it "returns position with greatest score from children example-2" do
        possible_moves = [ 
                            { position: 2, children: [], score: 0 },
                            { position: 1, children: [ 
                                                        { position: 7, children: [], score: 10 },
                                                     ], score: 0 
                            }
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(1)
    end
    
    it "returns position with greatest score from children example-3" do
        possible_moves = [ 
                            { position: 1, children: [ 
                                                        { position: 6, children: [], score: 20 },
                                                     ], score: 0 
                            },
                            { position: 2, children: [ 
                                                        { position: 7, children: [], score: 10 },
                                                     ], score: 0 
                            }
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(1)
    end

    it "returns position with greatest score from multiple children array example-1" do
        possible_moves = [ 
                            { position: 1, children: [ 
                                                        { position: 3, children: [], score: 20 },
                                                        { position: 4, children: [], score: 25 }
                                                     ], score: 0 
                            },
                            { position: 2, children: [ 
                                                        { position: 5, children: [], score: 10 },
                                                        { position: 6, children: [], score: 30 }
                                                     ], score: 0 
                            }
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(2)
    end

    it "returns position with greatest score from multiple children array example-2" do
        possible_moves = [ 
                            { position: 2, children: [ 
                                                        { position: 4, children: [], score: 10 },
                                                        { position: 5, children: [], score: 30}
                                                     ], score: 0 
                            },
                            { position: 1, children: [ 
                                                        { position: 3, children: [], score: 0 },
                                                        { position: 6, children: [], score: 10}
                                                     ], score: 10 
                            }
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(1)
    end

    it "returns position with greatest score from children of children example-3" do
        possible_moves = [ 
                            { position: 1, children: [ 
                                                      { position: 6, children: [
                                                                                 { position: 5, children: [], score: 20 }
                                                                              ], score: 0 
                                                      },
                                                     ], score: 0 
                            },
                            { position: 2, children: [ 
                                                      { position: 7, children: [], score: 10 },
                                                     ], score: 0 
                            }
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(2)
    end

    it "returns position with greatest score from children of children example-4" do
        possible_moves = [ 
                            { position: 1, children: [ 
                                                     { position: 6, children: [
                                                                                 { position: 5, children: [], score: 20 }
                                                                              ], score: 0 
                                                     },
                                                    ], score: 0 
                            },
                            { position: 2, children: [ 
                                                      { position: 7, children: [], score: 0 },
                                                     ], score: 0 
                            }
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(1)
    end

    it "returns position with greatest score from children 2 layers deep example-5" do
        possible_moves = [ 
                            { position: 1, children: [ 
                                                       { position: 6, children: [
                                                                                 { position: 9, children: [], score: 20 },
                                                                                 { position: 8, children: [], score: 30 }

                                                                                ], score: 0 
                                                       },
                                                     ], score: 0 
                            },
                            { position: 2, children: [ 
                                                      { position: 7, children: [
                                                                                { position: 5, children: [], score: 40 }
                                                                               ], score: 0 
                                                      },
                                                     ], score: 0 
                            }
                         ]
        expect(Minimax.best_position(possible_moves)).to eq(2)
    end
end
