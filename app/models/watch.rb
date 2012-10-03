class Watch < ActiveRecord::Base
  belongs_to :user, inverse_of: :watches
  belongs_to :conversation, counter_cache: true, inverse_of: :watches

end
