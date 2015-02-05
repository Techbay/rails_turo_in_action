# 4.6.1
def string_shuffle(s)
  s.split('').shuffle.join
end
string_shuffle("foobar")

# 4.6.2
class String
  def shuffle
    self.split('').shuffle.join
  end
end

# 4.6.3

