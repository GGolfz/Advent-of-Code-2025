require 'set'

$graph = {}
readlines.map(&:to_s).map { |line| 
    source, list = line.split(": ")
    destination = list.split(" ")
    $graph[source] = destination
}
$memo = {}

def count_paths_dag(current, destination)
  return 1 if current == destination

  key = [current, destination]
  return $memo[key] if $memo.key?(key)

  return $memo[key] = 0 unless $graph.key?(current)

  total = 0
  $graph[current].each do |next_node|
    total += count_paths_dag(next_node, destination)
  end

  $memo[key] = total
end

def paths_between_dag(start, dest)
  count_paths_dag(start, dest)
end

svr_to_dac = paths_between_dag("svr", "dac")
dac_to_fft = paths_between_dag("dac", "fft")
fft_to_out = paths_between_dag("fft", "out")

svr_to_fft = paths_between_dag("svr", "fft")
fft_to_dac = paths_between_dag("fft", "dac")
dac_to_out = paths_between_dag("dac", "out")

path1 = svr_to_dac * dac_to_fft * fft_to_out  # svr -> dac -> fft -> out
path2 = svr_to_fft * fft_to_dac * dac_to_out  # svr -> fft -> dac -> out

puts "path1 = #{path1}"
puts "path2 = #{path2}"
puts "all path = #{path1 + path2}"