# iOS Development Class Assignment #5
On top of last assignment domain-modeling
##Implement the CustomStringConvertible protocol on all types
  1. Define a "description" property of type String
  2. This property should return a human-readable version of the contents
  for example, Money should return "EUR22.0" (for amount 22.0 and currency EUR)
  3. Unit tests
  
##Define a new protocol: Mathematics
  1. mathematical operation methods (+, -) define it on Money
  2. write tests to verify that we can add and remove Money
  
##Use an extension to extend Double
  1. add four new extension properties, USD, EUR, GBP, CAN
  2. each should return a Money, each should convert the Double into a Money using "self" as the amount
  3. Unit tests
