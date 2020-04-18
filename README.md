# Snapask Practice

* Ruby version 2.7.0 (x86_64-linux)
* Rails version 5.1.7

### Part 1 

http://52.220.14.209:3000/lessons

* Sign up and log in first and manipulate lessons

* Test account
  * Email : test@test.com
  * Password : test
  
### Part 2 & Part 3

* Use postman to test API

  * Sign up : POST http://52.220.14.209:3000/api/v1/user/signup
  
    * **Request Body Example:**
      ```json=
      {
        "name":"test",
        "email":"test@test.com",
        "password":"test"
      }
      ```
      ---
  * Log in : POST http://52.220.14.209:3000/api/v1/user/login
  
    * **Request Body Example:**
      ```json=
      {
        "email":"test@test.com",
        "password":"test"
      }
      ```
      ---
  * Check out : POST http://52.220.14.209:3000/api/v1/lessons/checkout
  
    * **Request Headers:**

      |     Field     | Type   |      Description      |
      |:-------------:|:------ |:---------------------:|
      | Authorization | String | Access token Required |
    * **Request Body Example:**
      ```json=
      {
          "prime":"[Prime Key from TapPay]",
          "lesson_id" : "1"
      }
      ```
      ---
  * User's lesson : GET 
    * **Request Headers:**

      |     Field     | Type   |       Description       |
      |:-------------:|:------ |:-----------------------:|
      | Authorization | String | Access token   Required |
      
    * All lessons : http://52.220.14.209:3000/api/v1/user/lessons
    
    * Available lessons : http://52.220.14.209:3000/api/v1/user/lessons?status=available
    
    * Assign category : http://52.220.14.209:3000/api/v1/user/lessons?category=Math
---
 Detail note & API Document : https://hackmd.io/@JimmyFu/H1ujXWmdU
