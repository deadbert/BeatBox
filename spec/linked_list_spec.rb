require 'rspec'
require './lib/linked_list'

describe LinkedList do

    describe "#initialize" do
        list = LinkedList.new

        it "exists as LinkedList object" do
            expect(list).to be_a(LinkedList)
        end

        it "has a default attribute head that initializes as nil" do
            expect(list.head).to eq(nil)
        end
    end

    describe "#append" do
        list = LinkedList.new

        it "Adds a Node object to the end of LinkedList" do
            list.append("doop")
            list.append("woop")
    

            expect(list.head.data).to eq("doop")
            expect(list.head.next_node.next_node).to eq(nil)
        end
    end

    describe "#count" do
        it "can count the number of nodes in the list" do
            list = LinkedList.new

            list.append("doop")
            list.append("woop")

            expect(list.count).to eq(2)
        end

        it "can returns 0 when there are no Nodes in the list" do
            list = LinkedList.new

            expect(list.count).to eq(0)
        end
    end

    describe "#to_string" do
        list = LinkedList.new

        xit "combine nodes to form 1 string" do
            expect(list.to_string).to eq("doop")
        end
    end
end