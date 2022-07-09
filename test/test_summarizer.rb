# frozen_string_literal: true

require "test_helper"

class TestSummarizer < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Summarizer::VERSION
  end
end
