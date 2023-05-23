module BxBlockUserStatus
  class UserStatus < ApplicationRecord
    self.table_name = :user_statuses

    belongs_to :account, class_name: 'AccountBlock::Account'
  end
end
