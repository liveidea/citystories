require 'test_helper'

class StoryTest < ActiveSupport::TestCase
   test "Story must saves" do
     story = stories(:one)
     assert story.save
   end
end
