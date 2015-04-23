require 'spec_helper'

describe PositiveWebSupport do
  it 'has a version number' do
    expect(PositiveWebSupport::VERSION).not_to be nil
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