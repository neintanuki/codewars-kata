## ROT 13

**Language Used:** Ruby
<br />
**Kata Link:** https://www.codewars.com/kata/52223df9e8f98c7aa7000062/train/ruby

How can you tell an extrovert from an introvert at NSA? Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can decipher it? According to Wikipedia, ROT13 (http://en.wikipedia.org/wiki/ROT13) is frequently used to obfuscate jokes on USENET.

**Hint:** For this task you're only supposed to substitue characters. Not spaces, punctuation, numbers etc.

**Test examples:**

```
"EBG13 rknzcyr." -->
"ROT13 example."

"This is my first ROT13 excercise!" -->
"Guvf vf zl svefg EBG13 rkprepvfr!"
```

### Solutions

#### Best Solution

``` ruby
def rot13(message)
  message.tr "A-Za-z", "N-ZA-Mn-za-m"
end
```

#### My Solution

``` ruby
# encrypt/decrypt string using rot13
# string consists of letter, whitespaces, and numbers ex: "I love ROT13."
ROT = 13
MIN_LC = 97
MAX_LC = 122
MIN_UC = 65
MAX_UC = 90

def rot13(str)
  str = str.split('')
  translated_str = ""
  
  str.each do |ltr|
    if ltr.ord >= MIN_LC && ltr.ord <= MAX_LC
      translated_str.concat translate(ltr.ord, MIN_LC, MAX_LC)
    elsif ltr.ord >= MIN_UC && ltr.ord <= MAX_UC
      translated_str.concat translate(ltr.ord, MIN_UC, MAX_UC)
    else
      translated_str.concat ltr
    end
  end

  return translated_str
end

def translate(pos, min, max)
  remain = max - pos

  remain < ROT ? (min + (ROT - remain) - 1).chr : (pos + ROT).chr
end
```