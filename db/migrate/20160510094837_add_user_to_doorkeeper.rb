class AddUserToDoorkeeper < ActiveRecord::Migration
  def change
    add_foreign_key :oauth_access_grants, :user, column: :resource_owner_id
    add_foreign_key :oauth_access_tokens, :user, column: :resource_owner_id
  end
end
