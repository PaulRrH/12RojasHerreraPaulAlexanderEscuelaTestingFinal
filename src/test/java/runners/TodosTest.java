package runners;

import com.intuit.karate.junit5.Karate;

public class TodosTest {

    @Karate.Test
    Karate runAll() {
        return Karate.run("classpath:features");
    }

}
