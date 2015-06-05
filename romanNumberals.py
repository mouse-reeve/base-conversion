import math

def to_roman_numerals(number):
    buckets = [[1000, 'M'], [500, 'D'], [100, 'C'], [50, 'L'], [10, 'X'], [5, 'V'], [1, 'I']]
    roman = ''
    if not number:
        return 'nulla'
    else:
        for bucket in buckets:
            value = bucket[0]
            letter = bucket[1]
            if number >= value:
                roman += letter * int((math.floor(number/value)))
                number -= value * (math.floor(number/value))
            if not number:
                break

            if number == value - 1:
                roman += 'I' + letter
                number -= (value - 1)
        return roman

# XIII
print to_roman_numerals(13)

# L
print to_roman_numerals(50)

# LIX
print to_roman_numerals(59)

# MMXIV
print to_roman_numerals(2014)

# MMMMMMMMMMI
print to_roman_numerals(10001)
