Feature: Store - Eliminar orden
  Background:
    * url baseUrl

  @happypath @regresion
  Scenario: Eliminar orden existente
    * def oid = Math.floor(Math.random() * 999999)

    # Crear
    Given path 'store', 'order'
    And request { "id": #(oid), "petId": 1, "quantity": 1, "shipDate": "2026-01-01T00:00:00.000Z", "status": "placed", "complete": true }
    When method POST
    Then status 200

    # Eliminar
    Given path 'store', 'order', oid
    When method DELETE
    Then status 200

  @unhappypath
  Scenario: Eliminar orden inexistente devuelve 404
    Given path 'store', 'order', 888888888
    When method DELETE
    Then status 404
