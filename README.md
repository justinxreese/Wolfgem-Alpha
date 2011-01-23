# Wolfgem-Alpha  
## Introduction  
A gem used to access the
[Wolfram|Alpha API](http://products.wolframalpha.com/docs/WolframAlpha-API-Reference.pdf "Wolfram|Alpha API documentation (PDF)").  
### TODO  
- Parse input parameter better. Currently sending "3 + 5" will break the request because of spaces and "3+5" is interpretted as "3 5"
  and returns the result of "3*5", "15".  
- Add additional URL parameters
