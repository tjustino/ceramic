# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  meta_tag_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

# Tag Tests
class TagTest < ActiveSupport::TestCase
  test "should create tag" do
    tag = Tag.new(name: rand_text, meta_tag_id: rand_meta_tag)
    assert tag.valid?
  end

  test "should not create tag with not null data" do
    missing_name = Tag.new(name: nil, meta_tag_id: rand_meta_tag)
    assert missing_name.invalid?
    assert_equal ["ne peut pas être vide"], missing_name.errors[:name]

    missing_mt_id = Tag.new(name: rand_text, meta_tag_id: nil)
    assert missing_mt_id.invalid?
    assert_equal ["ne peut pas être vide"], missing_mt_id.errors[:meta_tag_id]
  end

  test "should not create tag with duplicated name" do
    duplicated_name = Tag.new(name: Tag.first.name, meta_tag_id: rand_meta_tag)
    assert duplicated_name.invalid?
    assert_equal ["a déjà été pris"], duplicated_name.errors[:name]
  end

  # TODO: test product_tag_relations, dependent: :restrict_with_error

  private ######################################################################

    def rand_text
      SecureRandom.hex
    end

    def rand_meta_tag
      offset = rand(MetaTag.count)
      MetaTag.offset(offset).first.id
    end
end
