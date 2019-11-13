Cron daemon fro seisma API
==========================


Build image
-----------

```bash
make build
```

Publish image
-------------

```bash
export DOCKER_USERNAME=<login>
export DOCKER_PASSWORD=<password>

make publish
```

Container environments
----------------------

* **DATABASE_HOST** - mysql database host
* **DATABASE_PORT** - mysql database port
* **DATABASE_USER** - mysql database user
* **DATABASE_PASSWORD** - mysql database password
* **ROTATE_FOR_DAYS** - delete builds older days
* **MAX_BUILD_TIMEOUT** - fix running builds after expired timeout
