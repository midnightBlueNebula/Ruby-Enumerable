require "./lib/enumerable.rb"

RSpec.describe Enumerable do

    arr = [5,10,15,20]

    describe "#my_each" do
        it "iterates over array's all elements." do
            res = []
            arr.my_each { |i| res << i*10 }
            expect(res).to eql([50,100,150,200])
        end
    end

    describe "#my_select" do
        it "returns array of elements that matches given condition." do
            expect(arr.my_select { |i| i > 10 }).to eql([15,20])
        end
    end

    describe "#my_all?" do
        it "checks if all elemets of array meets given requirement." do
            expect(arr.my_all? { |i| i % 5 == 0 }).to eql(true)
        end
    end

    describe "#my_any?" do
        it "checks if at least one element matches the given condition." do
            expect(arr.my_any? { |i| i % 2 == 0 }).to eql(true)
        end
    end

    describe "#my_none?" do
        it "checks if no element match the condition." do
            expect(arr.my_none? { |i| i % 2 == 0 }).to eql(false)
        end
    end

    describe "#my_count" do
        it "returns element count." do
            expect(arr.my_count).to eql(4)
        end
    end

    describe "#my_map" do
        it "iterates over array, passes the elements to given block, returns new array out of every itarations result." do
            expect(arr.my_map { |i| i*10 }).to eql([50,100,150,200])
        end
    end

    describe "#my_map_proc" do
        it "iterates over array, passes the elements to given proc, returns new array out of every itarations result." do
            new_proc = Proc.new { |i| i * 100 }
            expect(arr.my_map_proc(&new_proc)).to eql([500,1000,1500,2000])
        end
    end

    describe "#my_inject" do
        it "return sum of all elements." do
            expect(arr.my_inject { |sum,i| sum + i }).to eql(50)
        end

        it "return product of all elements." do
            expect(arr.my_inject(1) { |product,i| product * i }).to eql(15000)
        end
    end
end






