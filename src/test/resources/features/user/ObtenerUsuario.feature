Feature: User - Obtener usuario
  Background:
    * url baseUrl

  @happypath @regresion
  Scenario: Obtener usuario existente
    * def u = 'user_' + java.util.UUID.randomUUID()

    # Crear primero
    Given path 'user'
    And request { "id": 0, "username": "#(u)", "firstName": "A", "lastName": "B", "email": "a@b.com", "password": "X1!", "phone": "111", "userStatus": 1 }
    When method POST
    Then status 200

    # Consultar
    Given path 'user', u
    When method GET
    Then status 200
    And match response.username == u

  @unhappypath
  Scenario: Obtener usuario inexistente devuelve 404
    Given path 'user', 'no_existe_' + java.util.UUID.randomUUID()
    When method GET
    Then status 404