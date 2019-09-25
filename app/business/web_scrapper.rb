class WebScrapper
  require 'open-uri'

  def initialize(url)
    @document = load_document(url)
  end

  def get_username
    unless @document.blank?
      element = @document.css(".ProfileHeaderCard-screenname") \
      .css(".u-inlineBlock").css(".u-dir").css(".u-linkComplex-target")
      unless element.empty?
        return element[0].children[0].text
      end
    end
    nil
  end

  def get_description
    unless @document.blank?
      element = @document.css(".ProfileHeaderCard-bio").css(".u-dir")
      unless element.empty?
        return element[0].text
      end
    end
    nil
  end

  private

    def load_document(url)
      begin
        Nokogiri::HTML(open(url))
      rescue Errno::ENOENT
        []
      end
    end
end
