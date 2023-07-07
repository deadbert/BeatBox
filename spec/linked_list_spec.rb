require 'rspec'
require './lib/linked_list'

describe LinkedList do
    list = LinkedList.new

    describe "#initialize" do
        it "exists as LinkedList object" do
            expect(list).to be_a(LinkedList)
        end

        it "has a default attribute head that initializes as nil" do
            expect(list.head).to eq(nil)
        end
    end

    describe "#append" do
        it "Adds a Node object to the end of LinkedList" do
            list.append("doop")
            list.append("woop")

            expect(list.head.data).to eq("doop")
            expect(list.head.next_node.next_node).to eq(nil)
        end
    end

    describe "#count" do
        xit "can count the number of nodes in the list" do
            expect(list.count).to eq
        end
    end

    describe "#to_string" do
        xit "combine nodes to form 1 string" do
            expect(list.to_string).to eq("doop")
        end
    end
end