Feature: User - Login y Logout
  Background:
    * url baseUrl

  @happypath @regresion
  Scenario: Login válido y logout
    * def u = 'user_' + java.util.UUID.randomUUID()

    # Crear usuario
    Given path 'user'
    And request { "id": 0, "username": "#(u)", "firstName": "A", "lastName": "B", "email": "a@b.com", "password": "X1!", "phone": "111", "userStatus": 1 }
    When method POST
    Then status 200

    # Login
    Given path 'user', 'login'
    And param username = u
    And param password = 'X1!'
    When method GET
    Then status 200

    # Logout
    Given path 'user', 'logout'
    When method GET
    Then status 200