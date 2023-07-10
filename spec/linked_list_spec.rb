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

        it "combine nodes to form 1 string" do
            list = LinkedList.new

            list.append("doop")
            list.append("woop")
            list.append("pop")

            expect(list.to_string).to eq("doop woop pop")
        end

        it "can return empty string from empty list" do
            list = LinkedList.new

            expect(list.to_string).to eq("")
        end

        it "can return string when only 1 data node on list" do
            list = LinkedList.new

            list.append("doop")

            expect(list.to_string).to eq ("doop")
        end
    end

    describe "#prepend" do
        it "Add node to the beginning of the list" do
            list = LinkedList.new

            list.append("plop")
            expect(list.to_string).to eq("plop")
            list.append("suu")
            expect(list.to_string).to eq("plop suu")
            list.prepend("dop")
            expect(list.to_string).to eq("dop plop suu")
            expect(list.count).to eq(3)
        end
    end

    describe "#insert" do
        it "can insert node at given index" do
            list = LinkedList.new

            list.append("plop")
            expect(list.to_string).to eq("plop")
            list.append("suu")
            expect(list.to_string).to eq("plop suu")
            list.prepend("dop")
            expect(list.to_string).to eq("dop plop suu")
            expect(list.count).to eq(3)
            list.insert(1, "woo")
            expect(list.to_string).to eq("dop woo plop suu")
        end

        it "can recognize when #insert index is out of range" do
            list =LinkedList.new

            expect(list.insert(3, "woo")).to eq("Index out of range")
        end
    end

    describe "#find" do
        it "return the data from Node at index(x) and (y) nodes after" do
            list = LinkedList.new

            list.append("deep")
            list.append("woo")
            list.append("shi")
            list.append("shu")
            list.append("blop")
            
            expect(list.find(2, 1)).to eq("shi")
            expect(list.find(1, 3)).to eq("woo shi shu")
        end 

        it "returns No elements in list when find called on empty list" do
            list = LinkedList.new

            expect(list.find(1,2)).to eq("No elements in list")
        end
        it "returns error when index out of range" do
            list = LinkedList.new
            list.append("deep")

            expect(list.find(3, 1)).to eq("Index out of range")
        end 
    end 
end