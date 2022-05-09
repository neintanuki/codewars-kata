## Valid Parentheses

**Language Used:** Ruby
<br />
**Kata Link:** https://www.codewars.com/kata/52774a314c2333f0a7000688/train/ruby

Write a function that takes a string of parentheses, and determines if the order of the parentheses is valid. The function should return `true` if the string is valid, and `false` if it's invalid.

### Examples

``` ruby
"()"              =>  true
")(()))"          =>  false
"("               =>  false
"(())((()())())"  =>  true
```

### Constraints

``` ruby
0 <= input.length <= 100
```

Along with opening (`(`) and closing (`)`) parenthesis, input may contain any valid ASCII characters. Furthermore, the input string may be empty and/or not contain any parentheses at all. Do not treat other forms of brackets as parentheses (e.g. `[]`, `{}`, `<>`).

### Solutions

#### Best Solution

``` ruby
def valid_parentheses(string)
  open = 0
  string.chars.each do |c|
    open += 1 if c == "("
    open -= 1 if c == ")"
    return false if open < 0
  end
  open == 0
end
```

#### My Solution

``` ruby
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
```
