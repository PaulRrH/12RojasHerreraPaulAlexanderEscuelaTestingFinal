Feature: User - Crear usuario
  Background:
    * url baseUrl
    * def random = function(){ return java.util.UUID.randomUUID() + '' }
    * def username = 'user_' + random()

  @happypath @regresion
  Scenario: Crear usuario OK
    Given path 'user'
    And request
      """
      {
        "id": 0,
        "username": "#(username)",
        "firstName": "Test",
        "lastName": "User",
        "email": "test.user@example.com",
        "password": "P@ssw0rd!",
        "phone": "999999999",
        "userStatus": 1
      }
      """
    When method POST
    Then status 200
    And match response.code == 200

  @unhappypath
  Scenario: Crear usuario con body inválido (tipos incorrectos)
    Given path 'user'
    And request { "id": "ABC", "username": 12345, "firstName": true }
    When method POST
    Then status 500