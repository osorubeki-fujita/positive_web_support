require "positive_web_support/version"

require "active_support"
require "active_support/core_ext"
require 'date'
require "positive_basic_support"

require "positive_web_support/string_ext"
require "positive_web_support/date_ext"

module PositiveWebSupport

  extend ::ActiveSupport::Concern

  included do

    ::String.class_eval do
      include ::PositiveWebSupport::StringExt
    end

    ::Time.class_eval do
      include ::PositiveWebSupport::DateExt
    end

    ::Date.class_eval do
      include ::PositiveWebSupport::DateExt
    end

  end

end

include PositiveWebSupport
