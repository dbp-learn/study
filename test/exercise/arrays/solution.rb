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

        return middle if array[middle] == query

        return -1 if left == right

        return my_bisearch(array, query, left, middle) if array[middle] > query

        my_bisearch(array, query, middle + 1, right)
      end

      def search(array, query)
        return -1 if array.empty?

        my_bisearch(array, query, 0, array.length - 1)
      end
    end
  end
end
