module MethodsPracticeHelpersSpecHelpers

  def random_string(min_chars=8, max_chars=30)
    (min_chars..max_chars).map { (65 + rand(26)).chr }.join
  end

  def html_of(text)
    Nokogiri::HTML( text.gsub(/>\s*/, '>').gsub(/\s*</, '<') ).children[1].children[0].children
  end

end