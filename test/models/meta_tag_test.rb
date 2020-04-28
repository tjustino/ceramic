# frozen_string_literal: true

# == Schema Information
#
# Table name: meta_tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

# Meta Tag Tests
class MetaTagTest < ActiveSupport::TestCase
  test "should create meta tag" do
    meta_tag = MetaTag.new(name: rand_text)
    assert meta_tag.valid?
  end

  test "should not create meta tag with not null data" do
    missing_name = MetaTag.new(name: nil)
    assert missing_name.invalid?
    assert_equal ["ne peut pas être vide"], missing_name.errors[:name]
  end

  test "should not create meta tag whose name has already been taken" do
    duplicated_name = MetaTag.new(name: MetaTag.first.name)
    assert duplicated_name.invalid?
    assert_equal ["a déjà été pris"], duplicated_name.errors[:name]
  end

  test "should delete meta tag without tag association" do
    meta_tag = MetaTag.new(name: rand_text)
    meta_tag.save
    assert_equal meta_tag.tags.count, 0
    assert_difference("MetaTag.count", -1) { meta_tag.destroy }
    assert meta_tag.destroyed?
  end

  test "should not delete meta tag with tag association" do
    meta_tag = rand_meta_tag
    assert_not_equal meta_tag.tags.count, 0
    assert_no_difference("MetaTag.count") { meta_tag.destroy }
    assert_equal ["Impossible de supprimer car il existe des tags."],
                 meta_tag.errors[:base]
  end

  private ######################################################################

    def rand_text
      SecureRandom.hex
    end

    def rand_meta_tag
      offset = rand(MetaTag.count)
      MetaTag.offset(offset).first
    end
end
