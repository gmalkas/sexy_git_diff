class DiffPresenter

	NEW_FILE = "new_file"
	NEW_CHANGE = "new_change" 
	REMOVED = "removed" 
	ADDED = "added" 
	OTHER = "other" 

	attr_reader :content

	def initialize(diff)
    @content = diff.each_line.map do |line|
      { type: DiffPresenter.get_type(line), line: line }
		end
	end

	def self.get_type(line)
		return NEW_FILE if line =~/^---/
	  return ADDED if line =~ /^\+/
		return REMOVED if line =~ /^-/
	  return NEW_CHANGE if line =~ /^@/ 
		OTHER
	end
	
end
