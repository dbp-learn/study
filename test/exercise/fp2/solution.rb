module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while size > i
          yield self[i]
          i += 1
        end
        # Альтернативное решение
        # each { |item| yield(item) }
        self
      end

      # Написать свою функцию my_reduce
      def my_reduce(result = nil)
        my_each { |item| result = result.nil? ? item : yield(result, item) }

        # Альтернативное решение
        # each { |item| result = result.nil? ? item : yield(result, item) }
        result
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(self.class.new) { |result, item| result << yield(item) }
        # Альтернативное решение
        # result = self.class.new
        # each { |item| result << yield(item) }
        # result
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) { |result, item| item.nil? ? result : result << item }

        # Альтернативное решение
        # result = self.class.new
        # each { |item| result << item unless item.nil? }
        # result
      end
    end
  end
end
