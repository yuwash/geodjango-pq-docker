# geodjango-pq-docker
gdal, geos, psycopg2 installed with miniconda3

## Usage

For example if you already have a Django application, mount it and run the server:

```shell
docker run -p "$HOST_PORT":80 \
  -v /path/to/your/django-project:/myproject \
  yuwash/geodjango-pq \
  python /myproject/manage.py runserver 0.0.0.0:80
```

If you use `docker exec` make sure to run Python within the `geodjango` Conda Environment.
You can either use [geodjangosh](geodjangosh)

```shell
docker exec -it my-container geodjangosh python
```

or within the shell

```shell
source activate geodjango
```
