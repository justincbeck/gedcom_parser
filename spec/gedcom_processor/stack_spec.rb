require 'spec_helper'

module GedcomProcessor
  describe Stack do
    let(:stack) { Stack.new }
    
    it "should return nil when pop is called and the stack is empty" do
      stack.pop.should == nil
    end
    
    it "should return true when an item is pushed on to the stack" do
      stack.push(3).should == 3
    end
    
    it "should return a count that equals the size of the stack" do
      stack.push(3)
      stack.count.should == 1
    end
    
    it "should return the poped item when pop is called and the stack is not empty" do
      stack.push(3)
      stack.pop.should == 3
    end
    
    it "should have one less item when pop is called and the stack is not empty" do
      stack.push(3)
      stack.count.should == 1
      stack.pop.should == 3
      stack.count.should == 0
    end
    
    it "should return a size of 0 when the stack is empty" do
      stack.count.should == 0
    end
    
    it "should return the top item when peek is called and the stack is not empty" do
      stack.push(3)
      stack.peek.should == 3
    end
    
    it "should return nil when peek is called and the stack is empty" do
      stack.peek.should == nil
    end
    
    it "should still contain the top item after peek is called" do
      stack.push(3)
      stack.peek.should == 3
      stack.count.should == 1
    end
  end
end