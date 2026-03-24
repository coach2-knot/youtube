# Proyecto Karate YouTube - Coach

Proyecto de referencia para la sesion 10 usando YouTube Data API v3.

## Que demuestra

- `Scenario Outline`
- `Background`
- helper reutilizable
- tags y suites selectivas
- Allure
- ejemplo de pipeline con secret

## Estructura

```text
proyecto_karate_youtube_coach/
├── pom.xml
├── README.md
├── .github/workflows/karate-youtube-ci.yml
└── src/test/
    ├── java/
    │   └── KarateRunner.java
    └── resources/
        ├── allure.properties
        ├── karate-config.js
        ├── karate.properties
        └── features/
            ├── youtube_search.feature
            ├── youtube_videos.feature
            ├── youtube_channels.feature
            └── helpers/
                └── youtube_defaults.feature
```

## Configurar API Key

Opciones:

- editar `src/test/resources/karate.properties`
- exportar `YOUTUBE_API_KEY`
- usar `-DyoutubeApiKey=...`

## Comandos utiles

```bash
# Todo
mvn test

# Solo smoke
mvn test -Dkarate.options="--tags @smoke"

# Solo YouTube search
mvn test -Dkarate.options="src/test/resources/features/youtube_search.feature"

# Solo channels
mvn test -Dkarate.options="--tags @channels"

# Reporte Allure
mvn allure:report
```

## Notas didacticas

- `search` es ideal para `Scenario Outline`
- `videos` es ideal para JSON profundo y tipos string
- `channels` y `videoCategories` ayudan a mostrar endpoints adicionales
