module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.sort.last
        # max_value = array.reduce(array.first) { |max_val, val| max_val > val ? max_val : val }
        array.map { |val| val.positive? ? max_value : val }
      end

      def my_bisearch(array, query, left, right)
        middle = (left + (right - left) / 2).to_i

        middle_value = array[middle]
        if left == right && middle_value != query
          -1
        elsif middle_value == query
          middle
        elsif middle_value > query
          my_bisearch(array, query, left, middle)
        else
          # if middle_value < query
          my_bisearch(array, query, middle + 1, right)
        end
      end

      def search(array, query)
        return -1 if array.empty?

        my_bisearch(array, query, 0, array.length - 1)
      end
    end
  end
end
