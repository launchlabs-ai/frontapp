module Frontapp
  class Client
    module Accounts

      def accounts(params = {})
        list("accounts", params)
      end

      # Parameters
      # Name        Type    Description
      # -------------------------------
      # account_id  string  Id or alias of the requested account
      # -------------------------------
      def get_account(account_id)
        get("accounts/#{account_id}")
      end

      # Parameters
      # Name        Type    Description
      # -------------------------------
      # account_id  string  Id or alias of the requested account
      # -------------------------------
      #
      # Allowed attributes:
      # Name         Type                Description
      # --------------------------------------------
      # name          string (optional)   account name
      # description   string (optional)   account description
      # external_id   string (optional)   account external id
      # domains       array  (optional)   domains associated with account
      # custom_fields object (optional)   Custom field attributes for this account. Leave empty if you do not wish to update the attributes. Not sending existing attributes will automatically remove them.
      # --------------------------------------------
      def update_account!(account_id, params = {})
        cleaned = params.permit(:name,
                                :description,
                                :domains,
                                :external_id,
                                :custom_fields)
        update("accounts/#{account_id}", cleaned)
      end

      # Allowed attributes:
      # Name         Type                Description
      # --------------------------------------------
      # name          string (optional)   account name
      # description   string (optional)   account description
      # external_id   string (optional)   account external id
      # domains       array  (optional)   domains associated with account
      # custom_fields object (optional)   Custom field attributes for this account. Leave empty if you do not wish to update the attributes. Not sending existing attributes will automatically remove them.
      # --------------------------------------------
      def create_account!(params = {})
        cleaned = params.permit(:name,
                                :description,
                                :domains,
                                :external_id,
                                :custom_fields)
        create("accounts", cleaned)
      end

      # Name        Type    Description
      # -------------------------------
      # account_id  string  Id or alias of the requested account
      # -------------------------------
      def delete_account!(account_id)
        delete("accounts/#{account_id}")
      end

      # Parameters
      # Name        Type    Description
      # -------------------------------
      # account_id  string  Id or alias of the requested account
      # -------------------------------
      #
      # Allowed params:
      # Name        Type               Description
      # ----------------------------------------------
      # q           object (optional)  Search query.
      # q.statuses  array (optional)   List of the statuses of the conversations you want to list
      # ----------------------------------------------
      def get_account_contacts(account_id, params = {})
        cleaned = params.permit({})
        list("accounts/#{account_id}/contacts", cleaned)
      end


    end
  end
end
