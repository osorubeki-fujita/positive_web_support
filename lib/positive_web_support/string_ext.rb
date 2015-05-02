module PositiveWebSupport::StringExt

  # 16進数の文字列か否かを判定するメソッド
  # @return [Boolean]
  def hex_string?
    /\A[\da-fA-F]+\Z/ === self
  end

# @!group WebColor を表す文字列に対するメソッド

  # WebColor の文字列であるか否かを判定するメソッド
  # @return [Boolean]
  def is_web_color?( with_sharp: nil )
    raise "Error" unless with_sharp.nil? or with_sharp.boolean?

    # nil
    if with_sharp.nil?
      is_web_color_without_sharp? or is_web_color_with_sharp?
    # true
    elsif with_sharp
      is_web_color_with_sharp?
    # false
    else
      is_web_color_without_sharp?
    end
  end

  # WebColor を RgbColor に変換するメソッド
  # @return [::Array <Integer (natural number)>]
  def to_rgb_color
    unless is_web_color?
      raise "Error"
    end
    gsub( /\#/ , "" ).each_char.each_slice(2).map{ | ary | ary.join.hex }
  end

  def to_rgb_color_in_parentheses
    str = to_rgb_color.join( " , " )
    "(#{str})"
  end

  # @!endgroup

  private

  # WebColorの文字列（"#"なし）であるか否かを判定するメソッド
  # @return [Boolean]
  def is_web_color_without_sharp?
    hex_string? and length == 6
  end

  # WebColor の文字列（"#"あり）であるか否かを判定するメソッド
  # @return [Boolean]
  def is_web_color_with_sharp?
    if /\A\#(.+)\Z/ =~ self
      $1.is_web_color?( with_sharp: false )
    else
      false
    end
  end

end