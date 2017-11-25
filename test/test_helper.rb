# frozen_string_literal: true
require 'bundler/setup'
require 'single_cov'
SingleCov.setup :minitest

require 'maxitest/autorun'

$LOAD_PATH << File.expand_path("../../lib", __FILE__)

require "validates_uniqueness_via_association/version"
require "validates_uniqueness_via_association"

require_relative 'setup_test_models'
