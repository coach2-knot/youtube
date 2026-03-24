# Feature: Canales y categorias
# Demuestra: endpoints adicionales y datos maestros

Feature: YouTube Data API v3 - Channels and Categories

    Background:
        * url baseUrl
        * param key = youtubeApiKey
        * def defaults = call read('classpath:features/helpers/youtube_defaults.feature')

    @youtube @channels
    Scenario: Obtener informacion de un canal conocido
        * def channelId = 'UC_x5XG1OV2P6uZZ5FSM9Ttw'
        Given path 'channels'
        And param part = defaults.channelParts
        And param id = channelId
        When method GET
        Then status 200
        And match response.items == '#[1]'
        And match response.items[0].snippet.title == '#string'
        And match response.items[0].statistics.videoCount == '#string'

    @youtube @categories
    Scenario: Obtener categorias de video para Colombia
        Given path 'videoCategories'
        And param part = 'snippet'
        And param regionCode = 'CO'
        When method GET
        Then status 200
        And assert response.items.length > 0
        And match each response.items contains { id: '#string' }
        And match each response.items[*].snippet contains { title: '#string' }
