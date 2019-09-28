module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(self[i],i)
            i += 1
        end
    end

    def my_select
        i = 0
        res = []
        while i < self.length
            res.push(self[i]) if yield(self[i])
            i += 1
        end
        return res
    end

    def my_all?
        i = 0
        while i < self.length
            if yield(self[i]) == false
                return false
            end
            i += 1
        end
        return true
    end

    def my_any?
        i = 0
        while i < self.length
            if yield(self[i]) == true
                return true
            end
            i += 1
        end
        return false
    end

    def my_none?
        i = 0
        while i < self.length
            if yield(self[i]) == true
                return false
            end
            i += 1
        end
        return true
    end

    def my_count
        self.length
    end

    def my_map
        i = 0
        res = []
        while i < self.length
            j = yield(self[i])
            res.push(j)
            i += 1
        end
        return res
    end

    def my_inject(res = 0)
        i = 0
        while i < self.length
            res = yield(res,self[i])
            i += 1
        end
        return res
    end
end


arr = [5,10,15,20]

puts "******* my_each *******"

arr.my_each { |i| puts i*5 }

puts "******* my_each_with_index *******"

arr.my_each_with_index { |i,j| puts i*j }

puts "******* my_select *******"

new_arr = arr.my_select { |i| i > 10 }
puts new_arr

puts "******* my_all? *******"

puts arr.my_all? { |i| i % 5 == 0 }
puts arr.my_all? { |i| i % 2 == 0 }

puts "******* my_any? *******"

puts arr.my_any? { |i| i % 2 == 0 }
puts arr.my_any? { |i| i < 0 }

puts "******* my_none? *******"

puts arr.my_none? { |i| i % 2 == 0 }
puts arr.my_none? { |i| i < 0 }

puts "******* my_count *******"

puts arr.my_count

puts "******* my_map *******"

new_arr2 = arr.my_map { |i| i*5 }
puts new_arr2

puts "******* my_inject *******"

puts "+++ Sum +++"
puts arr.my_inject { |sum,i| sum + i }
puts "+++     ***"
puts "*** Product ***"
puts arr.my_inject(1) { |product,i| product * i }