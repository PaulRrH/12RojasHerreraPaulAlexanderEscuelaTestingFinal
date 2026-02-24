function fn() {
    var env = karate.env || 'dev';
    var config = {
        env: env,
        baseUrl: 'https://petstore.swagger.io/v2'
    };

    karate.configure('ssl', true);
    karate.configure('connectTimeout', 15000);
    karate.configure('readTimeout', 15000);
    karate.configure('logPrettyRequest', env === 'dev');
    karate.configure('logPrettyResponse', env === 'dev');
    karate.configure('headers', { 'Content-Type': 'application/json' });

    return config;
}