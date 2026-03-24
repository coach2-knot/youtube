import com.intuit.karate.junit5.Karate;
import io.qameta.allure.karate.AllureKarate;

/**
 * Karate Test Runner - YouTube Data API v3
 * Ejecuta todas las features bajo src/test/resources/features/
 *
 * Para ejecutar todos los tests:
 *   mvn test
 *
 * Para ejecutar solo tests con tag @smoke:
 *   mvn test -Dkarate.options="--tags @smoke"
 *
 * Para ejecutar un archivo específico:
 *   mvn test -Dkarate.options="src/test/resources/features/youtube_search.feature"
 */
public class KarateRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run()
                .hook(new AllureKarate())
                .relativeTo(getClass());
    }
}
