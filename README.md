### Run n8n on a Docker Container with 3rd party npm packages for javascript nodes
Repo: https://github.com/n8n-io/n8n

## How to run this sample?

```
docker volume create n8n_data
docker compose up
```

Open http://localhost:8080

## How to add more npm packages?
* Add an `npm install <package-name>` in `./Dockerfile`
* Append the package in the `NODE_FUNCTION_ALLOW_EXTERNAL` Env variable in `./Dockerfile`
* Run `Docker-compose up --build` to rebuild the image.

## Sample workflows
* Some sample workflows I made that can be imported in n8n from file are located in the `/workflows` folder.

Note: some of these flows require Cohere credentials and FTP server credentials.

```
Free Public FTP Server Credentials: 
-----------------------------
host:      test.rebex.net	
username:  demo 
password:  password
port:      21
-----------------------------
```

For cohere credentials, create a cohere account and generate an api key.