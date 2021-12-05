def is_valid_walk(walk)
walk.size == 10 && walk.count('n') == walk.count('s') && walk.count('e') == walk.count('w')
end


# Best Practices
# def isValidWalk(walk)
#   walk.count('w') == walk.count('e') and
#   walk.count('n') == walk.count('s') and
#   walk.count == 10
# end


# Rubyのand,&&とor,||の違いと注意点
# https://qiita.com/riku-shiru/items/533a01bdf18e2e3eef46
