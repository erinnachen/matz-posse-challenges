class TowerTransfer
  attr_reader :posts, :print_flag
  def initialize(n = 5, print_flag = false)
    @posts = {}
    @posts[1] = (1..n).to_a.reverse
    @posts[2] = []
    @posts[3] = []
    @print_flag = print_flag
  end

  def move_tower
    transfer(1, 3, @posts[1].length)
  end

  private

  def transfer(source_post_ind, target_post_ind, n)
    source_post = posts[source_post_ind]
    target_post = posts[target_post_ind]
    puts "CALLED TRANSFER WITH SOURCE: #{source_post_ind}, TARGET: #{target_post_ind} and NDISCS: #{n}" if print_flag
    if n == 1
      target_post << source_post.pop
      print_posts if print_flag
      1
    else
      empty_post_ind = empty_post_index(source_post_ind, target_post_ind)
      # Move stack of size n-1 to the empty post, move the biggest disc to the target post and move stack of size n-1 to the target post
      transfer(source_post_ind, empty_post_ind, n-1) +
      transfer(source_post_ind, target_post_ind, 1) +
      transfer(empty_post_ind, target_post_ind, n-1)
    end
  end

  def empty_post_index(source_post_ind, target_post_ind)
    6 - source_post_ind - target_post_ind
  end

  def print_posts
    puts "STATUS: 1: #{posts[1].inspect}\n
    2: #{posts[2].inspect}\n
    3: #{posts[3].inspect}"
  end

end

if __FILE__ == $0
  n = ARGV[0].to_i || 4
  tw = TowerTransfer.new(n, true)
  puts "TOTAL number of moves: #{tw.move_tower}"
end
