module BxBlockUserIdentification
	class UserIdentification < ApplicationRecord
		self.table_name = :user_identifications
		belongs_to :account, class_name: "AccountBlock::Account"
	end
end