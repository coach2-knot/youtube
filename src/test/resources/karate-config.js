function fn() {
    var Properties = Java.type('java.util.Properties');
    var StringReader = Java.type('java.io.StringReader');
    var fileProperties = new Properties();

    try {
        fileProperties.load(new StringReader(karate.readAsString('classpath:karate.properties')));
    } catch (e) {
        // karate.properties es opcional
    }

    var youtubeApiKey = karate.properties['youtubeApiKey']
        || java.lang.System.getenv('YOUTUBE_API_KEY')
        || fileProperties.getProperty('youtubeApiKey')
        || 'TU_API_KEY_AQUI';

    var config = {
        baseUrl: 'https://www.googleapis.com/youtube/v3',
        youtubeApiKey: youtubeApiKey,
        env: karate.env || 'dev'
    };

    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 15000);
    karate.configure('logPrettyResponse', true);
    karate.configure('logPrettyRequest', true);

    if (config.youtubeApiKey === 'TU_API_KEY_AQUI') {
        karate.log('YouTube API key no configurada. Usa YOUTUBE_API_KEY, -DyoutubeApiKey o src/test/resources/karate.properties.');
    }

    return config;
}
