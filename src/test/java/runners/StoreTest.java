package runners;

import com.intuit.karate.junit5.Karate;

public class StoreTest {

    @Karate.Test
    Karate runStore() {
        return Karate.run("classpath:features/store");
    }

}
