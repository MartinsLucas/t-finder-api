# frozen_string_literal: true

require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  setup do
    @profile = profiles(:john)
  end

  test "should save a profile" do
    count = Profile.count

    @new_profile = Profile.new(
      profile_name: "Carl Johnson",
      url: "www.twitter.com/GrooveStCJ"
    )

    assert @new_profile.save
    assert_equal((count + 1), Profile.count)
  end

  test "should not save a profile without a profile_name" do
    count = Profile.count

    @new_profile = Profile.new(
      url: "www.twitter.com/GrooveStCJ"
    )

    assert_not @new_profile.save
    assert_equal(count, Profile.count)
  end

  test "should not save a profile without a url" do
    count = Profile.count

    @new_profile = Profile.new(
      profile_name: "Carl Johnson"
    )

    assert_not @new_profile.save
    assert_equal(count, Profile.count)
  end

  test "should delete a profile" do
    count = Profile.count

    assert @profile.delete
    assert_equal((count - 1), Profile.count)
  end
end
