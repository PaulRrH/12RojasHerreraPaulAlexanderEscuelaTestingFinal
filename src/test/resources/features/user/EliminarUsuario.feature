Feature: User - Eliminar usuario
  Background:
    * url baseUrl

  @happypath @regresion
  Scenario: Eliminar usuario existente
    * def u = 'user_' + java.util.UUID.randomUUID()

    # Crear
    Given path 'user'
    And request { "id": 0, "username": "#(u)", "firstName": "A", "lastName": "B", "email": "a@b.com", "password": "X1!", "phone": "111", "userStatus": 1 }
    When method POST
    Then status 200

    # Eliminar
    Given path 'user', u
    When method DELETE
    Then status 200

  @unhappypath
  Scenario: Eliminar usuario inexistente devuelve 404
    Given path 'user', 'no_existe_' + java.util.UUID.randomUUID()
    When method DELETE
    Then status 404