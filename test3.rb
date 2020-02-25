
deck = []
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]
suits = ["clubs", "diamonds", "hearts", "spades"]


# for rank in ranks
#     for suit in suits
#         deck << "#{rank}_of_#{suit}"
#     end
# end

for rank in ranks
    deck << "#{rank}"
end

puts deck