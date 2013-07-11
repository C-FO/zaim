module Zaim
  class Version
    MAJOR = 0 unless defined? Zaim::Version::MAJOR
    MINOR = 1 unless defined? Zaim::Version::MINOR
    PATCH = 0 unless defined? Zaim::Version::PATCH
    PRE = nil unless defined? Zaim::Version::PRE

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end

    end
  end
end