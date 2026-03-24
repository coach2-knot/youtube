@ignore
Feature: Helper de defaults para YouTube

    Scenario: Exponer parametros reutilizables
        * def searchDefaults = { part: 'snippet', type: 'video', maxResults: 3 }
        * def videoParts = 'snippet,statistics,contentDetails'
        * def channelParts = 'snippet,statistics'
