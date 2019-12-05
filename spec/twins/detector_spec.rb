require 'spec_helper'

RSpec.describe Twins::Detector do
  it "detects twins strings" do
    expect(Twins::Detector.twins(%w(abcd abcd), %w(cdab bcda))).to eq(%w(Yes No))
  end
end
