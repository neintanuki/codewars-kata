def valid_parentheses(string)
  string = string.gsub(/\s+/, "").split("")
  
  unclosed = 0 # 1
  
  string.each_with_index do |x, y|
    if (x.eql?(")") && y.eql?(0))
      return false
    elsif (x.eql?("("))
      unclosed += 1
    elsif (x.eql?(")"))
      unclosed -= 1
    end
    
    return false if unclosed < 0
  end
    
  return !(unclosed > 0)
end


