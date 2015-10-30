module.exports =
  server:
    port: "SERVER_PORT"

  session:
    secret: "SESSION_STATE_SECRET"

  container:
    composed: "DOCKER_COMPOSED"

  clustering:
    workerLimit: "CLUSTERING_WORKER_LIMIT"

  database:
    connectionString: "DB_CONNECTION_STRING"
<% if (useDatabase('mongodb')) { %>
    composeConnection:
      host: "MONGO_1_PORT_27017_TCP_ADDR"
      port: "MONGO_1_PORT_27017_TCP_PORT"
<% } else if (useDatabase('sequelize')) { %>
    connection:
      user: "DB_CONNECTION_USER"
      password: "DB_CONNECTION_PASSWORD"
      port: "DB_CONNECTION_PORT"
      host: "DB_CONNECTION_HOST"
      dbName: "DB_CONNECTION_DBNAME"
      dialect: "DB_CONNECTION_DIALECT"
<% } %>
  auth:
    local:
      password:
        saltWorkFactor: "SALT_WORK_FACTOR"
<% if (useOAuthStrategy('facebook')) { %>
    facebook:
      clientID: "FACEBOOK_CLIENT_ID"
      clientSecret: "FACEBOOK_CLIENT_SECRET"
<% } if (useOAuthStrategy('twitter')) { %>
    twitter:
      consumerKey: "TWITTER_CONSUMER_KEY"
      consumerSecret: "TWITTER_CONSUMER_SECRET"
<% } if (useOAuthStrategy('google')) { %>
    google:
      clientID: "GOOGLE_CLIENT_ID"
      clientSecret: "GOOGLE_CLIENT_SECRET"
      scope: "GOOGLE_SCOPE"
<% } if (useOAuthStrategy('github')) { %>
    github:
      clientID: "GITHUB_CLIENT_ID"
      clientSecret: "GITHUB_CLIENT_SECRET"
      scope: "GITHUB_SCOPE"
<% } if (useOAuthStrategy('linkedin')) { %>
    linkedin:
      clientID: "LINKEDIN_CLIENT_ID"
      clientSecret: "LINKEDIN_CLIENT_SECRET"
      scope: "LINKEDIN_SCOPE"
<% } %>

