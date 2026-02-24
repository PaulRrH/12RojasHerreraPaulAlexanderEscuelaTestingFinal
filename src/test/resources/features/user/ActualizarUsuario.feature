Feature: User - Actualizar usuario
  Background:
    * url baseUrl

  @happypath @regresion
  Scenario: Actualizar usuario existente (mismo username en path y body)

    * def u = 'usuarioTest'

    Given path 'user', u
    And request
  """
  {
    "id": 10,
    "username": "#(u)",
    "firstName": "A2",
    "lastName": "B",
    "email": "a2@b.com",
    "password": "12345",
    "phone": "12345",
    "userStatus": 0
  }
  """
    When method PUT
    Then status 200
    And match response.message == '10'

  @unhappypath
  Scenario: Actualizar usuario inexistente
    Given path 'user', 'no_existe_' + java.util.UUID.randomUUID()
    And request { "id": 0, "username": "x" }
    When method PUT
    Then status 200