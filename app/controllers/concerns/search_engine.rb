module SearchEngine

  def build_hash
    
  end

  def search_description(description, query)
      words_list = description.downcase.split(%r{\W}) unless description.nil?
      make_search(words_list, query)
  end

  def search_name(name, query)
    name_lowercase = name.downcase unless name.nil?
    make_search(name_lowercase, query)
  end

  def make_search(target, query)
    result = []
    target ||= []
    query ||= ""
    query.downcase.split(%r{\W}).each do |word|
      unless word == ""
        result << word if (target.include? word) and (result.exclude? word)
      end
    end
    result
  end
end
