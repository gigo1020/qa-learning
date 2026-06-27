from typing import List

# https://leetcode.com/problems/convert-the-temperature/description/
# Task: Convert Celsius to Kelvin and Fahrenheit

class Solution:
    def convertTemperature(self, celsius: float) -> List[float]:
        kelvin = celsius + 273.15
        fahrenheit = celsius * 1.80 + 32.00
        return [kelvin, fahrenheit]

# Input: 36.50
# Output: [309.65000, 97.70000]

# Input: 122.11
# Output: [395.26000,251.79800]