# == Schema Information
#
# Table name: facts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  real        :boolean          default(TRUE)
#  provable    :boolean          default(FALSE)
#  color       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string
#  user_id     :integer
#

require 'test_helper'

class FactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
