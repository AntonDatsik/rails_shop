module SearchProductsHelper
	class QueryCreator
		attr_reader :query_str, :query_arg, :keywords
		
		def initialize(keywords)
			@keywords = keywords
			createQuery @keywords
		end
		
		def createQuery(keywords) 
			first_word = @keywords.split(' ')[0] << "%"
			@query_str = ""
			@query_arg = {:title => first_word}
			@query_str <<  case_insensitive(:title)
		end

		def case_insensitive(field_name) 
			"lower(#{field_name}) like :#{field_name}"
		end
	end
end
