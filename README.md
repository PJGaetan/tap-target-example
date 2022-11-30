# Example tap-target


## Set-up config

Mysql config in `mysql/config.json`.
Postgresql config in `postgres/config.json`.

Might be a good idea to pass them as volume in order to have a fully flexible
image.


## Build the image

```sh
make build
```

## Run the image

```sh
make run
```

Logs of all subsequente state are stored in ``./state.json``.
In order to run it in the cloud, it would be critical to find a way to store
and retrieve logs (in s3 for exemple).
In case the table is in full refresh mode, there is no need for it.


## Configure Properties

In order to discover tables and configure them.

```shell
virtualenv ./tap
source ./tap/bin/activate
pip3 install tap-mysql
tap-mysql --config mysql/config.json --discover > mysql/properties.json
```

## Dev

In order to run it locally, you can leverage the `docker-compose.yaml`

```shell
docker-compose up --build
```
