# frozen_string_literal: true

module Lite
  module Measurements
    class Base

      attr_accessor :amount

      def initialize(amount)
        @amount = amount
      end

      class << self

        def convert(amount, from:, to:)
          klass = new(amount)
          klass.convert(from: from, to: to)
        end

      end

      private

      def assert_all_valid_keys!(from, to, valid_keys)
        [from, to].each { |key| assert_valid_keys!(key, valid_keys) }
      end

      # rubocop:disable Style/GuardClause
      def assert_valid_keys!(key, valid_keys)
        if valid_keys.empty?
          raise ArgumentError, 'Missing key: conversion key must be provided'
        elsif !valid_keys.include?(key)
          raise ArgumentError,
                "Invalid key: #{key.inspect}." \
                "Allowed keys are: #{valid_keys.map(&:inspect).join(', ')}"
        end
      end
      # rubocop:enable Style/GuardClause

    end
  end
end
