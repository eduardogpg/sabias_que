# == Schema Information
#
# Table name: fact_tags
#
#  id         :integer          not null, primary key
#  fact_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FactTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
