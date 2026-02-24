Feature: Store - Obtener orden
  Background:
    * url baseUrl

  @happypath @regresion
  Scenario: Obtener orden existente
    * def oid = Math.floor(Math.random() * 999999)

    # Crear primero
    Given path 'store', 'order'
    And request { "id": #(oid), "petId": 1, "quantity": 1, "shipDate": "2026-01-01T00:00:00.000Z", "status": "placed", "complete": true }
    When method POST
    Then status 200

    # Consultar
    Given path 'store', 'order', oid
    When method GET
    Then status 200
    And match response.id == oid

  @unhappypath
  Scenario: Obtener orden inexistente devuelve 404
    Given path 'store', 'order', 999999999
    When method GET
    Then status 404