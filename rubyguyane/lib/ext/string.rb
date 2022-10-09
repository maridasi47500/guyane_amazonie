require 'active_support/core_ext/string/multibyte'
class String
  def squish
    dup.squish!
  end

  def squish!
    gsub!(/[[:space:]]+/, " ")
    strip!
    self
  end
  

    def transliterate(string, replacement = "?")
      I18n.transliterate(ActiveSupport::Multibyte::Unicode.normalize(
        ActiveSupport::Multibyte::Unicode.tidy_bytes(string), :c),
          :replacement => replacement)
    end

    def parameterize(string, sep = '-')
      # replace accented chars with their ascii equivalents
      parameterized_string = transliterate(string)
      # Turn unwanted chars into the separator
      parameterized_string.gsub!(/[^a-z0-9\-_]+/i, sep)
      unless sep.nil? || sep.empty?
        re_sep = Regexp.escape(sep)
        # No more than one of the separator in a row.
        parameterized_string.gsub!(/#{re_sep}{2,}/, sep)
        # Remove leading/trailing separator.
        parameterized_string.gsub!(/^#{re_sep}|#{re_sep}$/i, '')
      end
      parameterized_string.downcase
    end

  
end
