Feature: Store - Crear orden
  Background:
    * url baseUrl
    * def orderId = Math.floor(Math.random() * 999999)

  @happypath @regresion
  Scenario: Crear orden OK
    Given path 'store', 'order'
    And request
      """
      {
        "id": #(orderId),
        "petId": 1,
        "quantity": 1,
        "shipDate": "2026-01-01T00:00:00.000Z",
        "status": "placed",
        "complete": true
      }
      """
    When method POST
    Then status 200
    And match response.id == orderId

  @unhappypath
  Scenario: Crear orden con body inválido
    Given path 'store', 'order'
    And request { "id": "abc" }
    When method POST
    Then status 500