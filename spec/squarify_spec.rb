# frozen_string_literal: true

RSpec.describe Squarify do
  it "has a version number" do
    expect(Squarify::VERSION).not_to be nil
  end

  it "prints a line" do
    size = 80
    squarify = Squarify::Console.new size
    expect(squarify.line).to eq("┃#{"━" * (size - 2)}┃")
  end

  it "squarifies a long text" do
    size = 80
    squarify = Squarify::Console.new size
    expect(squarify.text(("a".."z").to_a.join * 4)).to eq("┃abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst" \
      "uvwxyzabcdefghijklmnopqrstuvw...┃")
  end

  it "squarifies a short text" do
    size = 80
    squarify = Squarify::Console.new size
    expect(squarify.text(("a".."z").to_a.join * 2)).to eq("┃abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstu" \
      "vwxyz                          ┃")
  end

  it "squarifies a short text and centers it" do
    size = 80
    squarify = Squarify::Console.new size
    expect(squarify.text((("a".."z").to_a.join * 2), "center")).to eq("┃             abcdefghijklmnopqrs" \
      "tuvwxyzabcdefghijklmnopqrstuvwxyz             ┃")
  end

  it "squarifies and saves output" do
    size = 80
    squarify = Squarify::Console.new size, record: true
    squarify.text (("a".."z").to_a.join * 2), "center"
    expect(squarify.stdout).to eq("             abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstu" \
      "vwxyz             \n")
  end

  it "squarifies without saves output" do
    size = 80
    squarify = Squarify::Console.new size
    squarify.text (("a".."z").to_a.join * 2), "center"
    expect(squarify.stdout).to eq(nil)
  end
end
