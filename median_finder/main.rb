class MedianFinder
    attr_reader :num_arr, :length

    def initialize
        @num_arr = []
        @length = 0
    end

    def add_num(num)
        low = 0
        high = @length - 1

        while low <= high
            mid = (low + high) / 2

            if @num_arr[mid] < num
                low = mid + 1
            else
                high = mid - 1
            end
        end

        @num_arr.insert(low, num)
        @length += 1
    end

    def find_median()
        return nil if @length == 0

        if @length % 2 != 0
            return @num_arr[@length / 2]
        else
            return (@num_arr[@length / 2] + @num_arr[@length / 2 - 1]) / 2.0
        end
    end
end

mf = MedianFinder.new()
puts mf.find_median()
mf.add_num(1)
puts mf.find_median()
mf.add_num(2)
puts mf.find_median()
mf.add_num(10)
puts mf.find_median()
mf.add_num(7)
puts mf.find_median()
mf.add_num(4)
puts mf.find_median()

