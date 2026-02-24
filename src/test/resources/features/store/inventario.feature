Feature: Store - Inventario
  Background:
    * url baseUrl

  @happypath @regresion
  Scenario: Obtener inventario
    Given path 'store', 'inventory'
    When method GET
    Then status 200
    And match response == '#object'