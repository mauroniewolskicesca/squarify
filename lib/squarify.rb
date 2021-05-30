# frozen_string_literal: true

require_relative "squarify/version"

module Squarify
  # This module contains the Squarify classes
  class Console
    # This class allows formatting text like a ticket
    attr_reader :stdout, :size, :record

    def initialize(size, record: false)
      @size = size
      @record = record
      @stdout = "" if record
    end

    def line(options: nil)
      box "━" * (@size - 2), options
    end

    def text(sentence, options = nil)
      if options.eql? "center"
        sentence = truncate(sentence.center(@size - 2), @size - 2)
      else
        sentence = truncate(sentence, @size - 2)
        sentence += " " * (@size - sentence.length - 2)
      end
      @stdout += "#{sentence}\n" if @record
      box sentence, options
    end

    private

    def box(sentence, options)
      case options
      when "top"
        "┏#{sentence}┓"
      when "bottom"
        "┗#{sentence}┛"
      when "middle"
        "┣#{sentence}┫"
      else
        "┃#{sentence}┃"
      end
    end

    def truncate(string, max)
      string.length > max ? "#{string[0...max - 3]}..." : string
    end
  end
end
