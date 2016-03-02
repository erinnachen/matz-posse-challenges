class TowerTransfer
  attr_reader :posts
  def initialize(n = 5)
    @posts = {}
    @posts[1] = (1..n).to_a.reverse
    @posts[2] = []
    @posts[3] = []
  end

  def move_tower
    transfer(1, 3, @posts[1].length)
  end

  def transfer(source_post_ind,target_post_ind, n)
    source_post = posts[source_post_ind]
    target_post = posts[target_post_ind]
    puts "CALLED TRANSFER WITH SOURCE: #{source_post_ind}, TARGET: #{target_post_ind} and NDISCS: #{n}"
    if n == 1
      target_post << source_post.pop
      print_posts
      1
    else
      transfer(source_post_ind, empty_post_ind(source_post_ind, target_post_ind), n-1)+transfer(source_post_ind, target_post_ind, 1) +
      transfer(empty_post_ind(source_post_ind, target_post_ind), target_post_ind, n-1)
    end
  end

  def empty_post_ind(source_post_ind, target_post_ind)
    if source_post_ind==1 && target_post_ind==3
      2
    elsif source_post_ind==1&& target_post_ind==2
      3
    elsif source_post_ind==2&& target_post_ind==1
      3
    elsif source_post_ind==2&& target_post_ind==3
      1
    elsif source_post_ind==3&& target_post_ind==1
      2
    else
      1
    end
  end

  def print_posts
    puts "STATUS: 1: #{@posts[1].inspect}\n
    2: #{@posts[2].inspect}\n
    3: #{@posts[3].inspect}"
  end

end

if __FILE__ == $0
  n = 10
  tw = TowerTransfer.new(n)
  puts "TOTAL number of moves: #{tw.move_tower}"
  puts "Formula = #{2**n-1}"
end
