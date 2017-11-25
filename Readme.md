ActiveRecord: Validate uniqueness of multiple newly associated records, 
helpful for mass-assingment with `accepts_nested_attributes_for`.

# Problem

```Ruby
class Membership
  validate :name, uniqueness: {scope: :user_id}
end

user.memberships.build name: 'foo' # thinks it is valid
user.memberships.build name: 'foo' # thinks it is valid
user.save # -> Sql error
```

# Solution

```Ruby
require 'validates_uniqueness_via_association'

class Membership < ActiveRecord::Base
  extend ValidatesUniquenessViaAssociation
  validates_uniqueness_via_association :name, :user, associated: :memberships
end

user.memberships.build name: 'foo'
user.memberships.build name: 'foo'
user.save # false ... both memberships are marked invalid
```

Install
=======

```Bash
gem install validates_uniqueness_via_association
```

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://travis-ci.org/grosser/validates_uniqueness_via_association.png)](https://travis-ci.org/grosser/validates_uniqueness_via_association)
