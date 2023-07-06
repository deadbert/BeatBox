require 'rspec'
require './lib/linked_list'

describe LinkedList do
    list = LinkedList.new

    desribe "#initialize" do
        it "exists as LinkedList object" do
            expect(list).to be_a(LinkedList)
        end

        it "has a default attribute head that initializes as nil" do
            expect(list.head).to eq(nil)
        end
    end
    
end