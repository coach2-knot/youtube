# Feature: Detalle de videos
# Demuestra: validaciones profundas, negative case y tipos string

Feature: YouTube Data API v3 - Videos

    Background:
        * url baseUrl
        * param key = youtubeApiKey
        * def defaults = call read('classpath:features/helpers/youtube_defaults.feature')

    @smoke @youtube @videos
    Scenario: Obtener detalle de un video conocido
        * def videoId = 'wxIxWTTsBj4'
        Given path 'videos'
        And param part = defaults.videoParts
        And param id = videoId
        When method GET
        Then status 200
        And match response.items == '#[1]'
        And match response.items[0].id == videoId
        And match response.items[0].snippet.title == '#string'
        And match response.items[0].statistics.viewCount == '#string'
        And match response.items[0].contentDetails.duration == '#string'

    @schema @youtube @videos
    Scenario: Validar schema completo de detalle
        * def videoId = 'dQw4w9WgXcQ'
        Given path 'videos'
        And param part = defaults.videoParts
        And param id = videoId
        When method GET
        Then status 200
        And match response.items[0] contains
            """
            {
                id: '#string',
                snippet: {
                    title: '#string',
                    channelTitle: '#string',
                    publishedAt: '#string'
                },
                statistics: {
                    viewCount: '#string'
                },
                contentDetails: {
                    duration: '#string'
                }
            }
            """

    @negative @youtube @videos
    Scenario: Video inexistente retorna lista vacia
        * def invalidVideoId = 'invalid-video-id-123'
        Given path 'videos'
        And param part = defaults.videoParts
        And param id = invalidVideoId
        When method GET
        Then status 200
        And match response.items == '#[]'
