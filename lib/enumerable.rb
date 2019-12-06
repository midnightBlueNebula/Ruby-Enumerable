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

    def my_map_proc(&proc)
        i = 0
        res = []
        while i < self.length
            j = proc.call(self[i])
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


