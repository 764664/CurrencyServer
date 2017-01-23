class Currency < ApplicationRecord
  enum source: { unionpay: 0 }
end
