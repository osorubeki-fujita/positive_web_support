require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = ::File.open( "#{ ::File.dirname( __FILE__ ) }/../.current_version" , "r:utf-8" ).read.chomp

describe PositiveWebSupport do
  it "has a version number \'#{ version }\'" do
    expect( ::Deplo.version_check( PositiveWebSupport::VERSION , spec_filename ) ).to eq( true )
  end

  it 'has a method \#is_web_color?, that decide whether a string means web color or not.' do
    expect( "109ed4".is_web_color? ).to eq( true )
    expect( "109ed4".is_web_color?( with_sharp: true ) ).to eq( false )
    expect( "109ed4".is_web_color?( with_sharp: false ) ).to eq( true )
    expect( "109ed4".is_web_color?( with_sharp: nil ) ).to eq( true )

    expect( "\#109ed4".is_web_color? ).to eq( true )
    expect( "\#109ed4".is_web_color?( with_sharp: true ) ).to eq( true )
    expect( "\#109ed4".is_web_color?( with_sharp: false ) ).to eq( false )
    expect( "\#109ed4".is_web_color?( with_sharp: nil ) ).to eq( true )
  end
end
