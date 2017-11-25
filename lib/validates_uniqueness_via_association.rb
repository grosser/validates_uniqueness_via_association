# frozen_string_literal: true
# there are 2 ways of failing a uniqueness validation:
# - change a single record
# - assign multiple new records with the same value
# validates :uniqueness only covers the first ... this covers both!

require "active_record"

module ValidatesUniquenessViaAssociation
  def validates_uniqueness_via_association(attribute, association, message: :taken, associated: nil)
    validate do
      siblings = send(association).send(associated || self.class.name.underscore.pluralize) + [self]
      siblings.uniq!
      errors.add attribute, message if siblings.map(&attribute.to_sym).uniq!
    end
  end
end
