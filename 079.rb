class Graph
  require 'set'

  def initialize(enum)
    @adj_list = Hash[enum.map { |v| [v, Set.new] }]
    @indegree = Hash[enum.map { |v| [v, 0] }]
  end

  def insert_edge(v, u)
    return if adjacent?(v, u)
    @adj_list[v].add(u)
    @indegree[u] += 1
  end

  def remove_edge(v, u)
    return unless adjacent?(v, u)
    @adj_list[v].delete(u)
    @indegree[u] -= 1
  end

  def adjacent?(v, u)
    @adj_list[v].include?(u)
  end

  def print_list
    @adj_list.each do |v, set|
      puts "#{v}: #{set.to_a}"
    end
  end

  def topological_sort!
    list = []
    queue = @indegree.select { |k,v| v == 0 }.each_key.to_a

    until queue.empty?
      v = queue.shift
      list << v

      @adj_list[v].each do |u|
        remove_edge(v, u)
        if @indegree[u] == 0
          queue << u
        end
      end
    end

    list
  end
end

data = %w(319
680
180
690
129
620
762
689
762
318
368
710
720
710
629
168
160
689
716
731
736
729
316
729
729
710
769
290
719
680
318
389
162
289
162
718
729
319
790
680
890
362
319
760
316
729
380
319
728
716)

vertices = data.join.split('').uniq!.sort!.map(&:to_i)
dag = Graph.new(vertices)

data.each do |s|
  s.chars.map(&:to_i).each_cons(2) do |a|
    dag.insert_edge(a[0], a[1])
  end
end

puts dag.topological_sort!.join
