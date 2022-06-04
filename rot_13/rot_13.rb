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