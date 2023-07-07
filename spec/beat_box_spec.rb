require './lib/beat_box'
require './lib/node'
require './lib/linked_list'

describe BeatBox do
  describe "#initialize" do
    it "exists" do
      bb = BeatBox.new

      expect(bb).to be_a(BeatBox)
      expect(bb.list).to be_a(LinkedList)
      expect(bb.list.head).to eq(nil)
    end
  end

  describe "#append" do
    it "split string and append words as individual nodes to list" do
      bb = BeatBox.new

      bb.append("deep doo ditt")
      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")

      bb.append("woo hoo shu")
      expect(bb.count).to eq(6)
    end  
  end

  describe "#play" do 
    it "play the sounds of music" do
      bb = BeatBox.new

      bb.append("deep doo ditt woo hoo shu")
      expect(bb.count).to eq(6)
      expect(bb.list.count).to eq(6)
      bb.play
    end

    it "can validate data and only select accepted words" do
      bb = BeatBox.new

      bb.append("mississipi mississipi mississipi mississipi mississipi mississipi")

      expect(bb.count).to eq(0)
    end
  end
end