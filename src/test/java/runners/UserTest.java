package runners;

import com.intuit.karate.junit5.Karate;

public class UserTest {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:features/user");
    }

}
