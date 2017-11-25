# frozen_string_literal: true
require_relative 'test_helper'

SingleCov.covered! file: 'lib/validates_uniqueness_via_association.rb'

describe ValidatesUniquenessViaAssociation do
  def refute_valid(record)
    refute record.valid?, record.errors.full_messages
  end

  let(:user) { User.create! }
  let(:membership) { Membership.create!(user: user, name: 'foo') }
  let(:attributes) { membership.attributes.except("id") }

  it "is valid without siblings" do
    membership.class.delete_all
    Membership.create!(attributes)
  end

  it "is valid for unique" do
    Membership.create!(attributes.merge("name" => "other"))
  end

  it "shows error when creating duplicate" do
    new = Membership.create(attributes)
    refute_valid new
    # In UI: Memberships name has already been taken
    new.errors.full_messages.must_equal ["Name has already been taken"]
  end

  it "shows error when modifying duplicate" do
    new = Membership.create!(attributes.merge("name" => "other"))
    new.name = membership.name
    refute_valid new
    new.errors.full_messages.must_equal ["Name has already been taken"]
  end

  it "validates duplicated attributes for built siblings" do
    membership.user.memberships_attributes = {
      0 => {name: "foo"},
      1 => {name: "foo"}
    }
    refute_valid membership
    # In UI: Memberships name must be unique
    membership.errors.full_messages.must_equal ["Name has already been taken"]
  end
end
