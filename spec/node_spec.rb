require 'rspec'
require './lib/node'

describe Node do
    node = Node.new("plop")

    describe "#initialize" do
        it "exists" do
            expect(node).to be_a(Node)
        end 

        it "has readable data and next_node attributes" do
            expect(node.data).to eq("plop")
            expect(node.next_node).to eq(nil)
        end
    end

end