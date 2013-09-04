module Sendable
  extend ActiveSupport::Concern
  
  included do
    after_save :deliver_unless_sent
  end
  
  def deliver_unless_sent
    deliver! unless sent?
  end
end