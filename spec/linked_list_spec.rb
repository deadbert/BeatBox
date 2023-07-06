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

            expect(list.head.data).to eq("doop")
            expect(list.head.next_node).to eq(nil)
        end
    end

    descirbe "#count" do
        it "can count the number of nodes in the list" do
            expect(list.count).to eq
        end
    end

    descirbe "#to_string" do
        it "combine nodes to form 1 string" do
            expect(list.to_string).to eq("doop")
        end
    end
end