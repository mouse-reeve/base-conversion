import math

def to_negative_base(number, radix):
    result = 0

    while number != 0:
        exp = 0 if number > 0 else 1
        temp_sum = 0
        while abs(temp_sum) < abs(number):
            temp_sum += (-radix-1) * pow(radix, exp)
            exp += 2
        exp -= 2
        digit = math.floor(number/pow(radix, exp))
        digit = digit if digit else 1

        number -= digit * pow(radix, exp)
        result += digit * pow(10, exp)
    return int(result)

# 10 base 10 -> 190 base -10
print to_negative_base(10, -10)

# 10 base 10 -> 11110 base -2
print to_negative_base(10, -2)
