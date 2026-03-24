# Feature: Busqueda de videos
# Demuestra: Background, helper reutilizable, Scenario Outline y match each

Feature: YouTube Data API v3 - Search

    Background:
        * url baseUrl
        * param key = youtubeApiKey
        * def defaults = call read('classpath:features/helpers/youtube_defaults.feature')

    @smoke @youtube @search
    Scenario: Buscar videos de automation testing
        Given path 'search'
        And param part = defaults.searchDefaults.part
        And param q = 'automation testing'
        And param type = defaults.searchDefaults.type
        And param maxResults = defaults.searchDefaults.maxResults
        When method GET
        Then status 200
        And match response.items == '#[3]'
        And match each response.items contains { kind: 'youtube#searchResult' }
        And match each response.items[*].id contains { videoId: '#string' }
        And match each response.items[*].snippet contains { title: '#string', channelTitle: '#string' }

    @parametrized @youtube @search
    Scenario Outline: Buscar videos por tema
        Given path 'search'
        And param part = defaults.searchDefaults.part
        And param q = '<tema>'
        And param type = defaults.searchDefaults.type
        And param maxResults = defaults.searchDefaults.maxResults
        When method GET
        Then status 200
        And match response.items == '#[3]'
        And match each response.items[*].snippet contains { title: '#string' }

        Examples:
            | tema                    |
            | karate dsl testing      |
            | cucumber bdd tutorial   |
            | appium mobile testing   |

    @schema @youtube @search
    Scenario: Validar schema basico de search
        Given path 'search'
        And param part = defaults.searchDefaults.part
        And param q = 'quality assurance'
        And param type = defaults.searchDefaults.type
        And param maxResults = 3
        When method GET
        Then status 200
        And match each response.items contains
            """
            {
                kind: 'youtube#searchResult',
                id: { videoId: '#string' },
                snippet: {
                    publishedAt: '#string',
                    channelId: '#string',
                    title: '#string',
                    channelTitle: '#string'
                }
            }
            """
