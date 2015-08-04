module PositiveWebSupport::DateExt

  def wday_class
    if holiday?
      'holiday'
    else
      strftime( "%A" ).downcase
    end
  end

end
