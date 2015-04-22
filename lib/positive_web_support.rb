require "positive_web_support/version"

require "active_support"
require "active_support/core_ext"
require "positive_support"

require "positive_web_support/string_ext"

module PositiveWebSupport

  extend ::ActiveSupport::Concern

  included do

    [ :String ].each do | class_name |
      eval <<-INCLUDE
        ::#{ class_name }.class_eval do
          include ::PositiveWebSupport::#{ class_name }Ext
        end
      INCLUDE
    end

  end

end

include PositiveWebSupport