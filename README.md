# MongoDB on Elestio with CI/CD

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/mongodb"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy a MongoDB instance to elestio.

# Once deployed ...

You can connect to your server with any MongoDB client with those credentials:

    Host: [CI_CD_DOMAIN]
    Port: 27710
    Auth type: SCRAM-SHA-1
    Login: admin
    Password: [SOFTWARE_PASSWORD] (set in env var)
    Database: admin

Connection URI for MongoDB Compass: 

    mongodb://admin:[SOFTWARE_PASSWORD]@[CI_CD_DOMAIN]:27710?authMechanism=SCRAM-SHA-1&authSource=admin

You can download & install MongoDB Compass from this link:
https://www.mongodb.com/try/download/compass


You can also connect to mongodb through mongo-express Web UI:

    https://[CI_CD_DOMAIN]/
    Login: admin
    Password: [SOFTWARE_PASSWORD]

You can also connect to mongodb with the mongo cli tool like this:

    apt install mongodb-clients;
    mongo [CI_CD_DOMAIN]:27710/admin -u admin -p [SOFTWARE_PASSWORD];


To connect from node.js you'll need the package mongodb then you can connect like this:

    var MongoClient = require('mongodb').MongoClient
    var f = require('util').format
    var assert = require('assert');

    // Connection URL
    var url = 'mongodb://admin:[SOFTWARE_PASSWORD]@[CI_CD_DOMAIN]:27710?authMechanism=SCRAM-SHA-1&authSource=admin';

    // Use connect method to connect to the Server
    MongoClient.connect(url, function(err, db) {
        assert.equal(null, err);
        console.log("Connected correctly to server");
        db.close();
    });
