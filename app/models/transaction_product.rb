class TransactionProduct < ApplicationRecord
    belongs_to :product
    belongs_to :purchased_transaction, class_name: 'Transaction'

end

