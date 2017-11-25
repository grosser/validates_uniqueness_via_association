# connect
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

# create tables
ActiveRecord::Schema.verbose = false
ActiveRecord::Schema.define(:version => 1) do
  create_table :users
  create_table :memberships do |t|
    t.string :name, null: false
    t.integer :user_id, null: false
    t.index [:name, :user_id], unique: true
  end
end

# create models
class User < ActiveRecord::Base
  has_many :memberships
  accepts_nested_attributes_for :memberships
end

class Membership < ActiveRecord::Base
  extend ValidatesUniquenessViaAssociation
  validates_uniqueness_via_association :name, :user
  belongs_to :user
end
