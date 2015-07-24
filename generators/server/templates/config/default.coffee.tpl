module.exports =
    app:
        name: '<%= name %>'

    session:
        name: '<%= name %>'
        secret: 'random_gibberish'
        proxy: true

    auth:
        local:
            password:
                saltWorkFactor: 10<% if (facebookAuth) { %>
        facebook:
            clientID: 'your_client_id'
            clientSecret: 'bogus_secret'
            callbackUrl: 'http://localhost:9000/api/auth/facebook/callback'<% } %><% if (twitterAuth) { %>
        twitter:
            consumerKey: 'your_consumer_key'
            consumerSecret: 'bogus_secret'
            callbackURL: 'http://localhost:9000/api/auth/twitter/callback'<% } %><% if (googleAuth) { %>
        google:
            clientID: 'your_consumer_key'
            clientSecret: 'bogus_secret'
            callbackURL: 'http://localhost:9000/api/auth/google/callback'
            scope: 'https://www.googleapis.com/auth/plus.login'<% } %>

    container:
        composed: 0

    clustering:
        workerLimit: 1
        entryPoint: __dirname + '/../server/main'

    server:
        port: 9000

    database:
        connectionString: 'mongodb://localhost/<%= name %>'
        populateSeedData: true
        composeConnection:
            dbName: '<%= name %>'
