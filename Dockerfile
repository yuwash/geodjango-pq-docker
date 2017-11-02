FROM continuumio/miniconda3:latest

ENV GEODJANGO_ENV_PATH=/opt/conda/envs/geodjango
RUN set -ex \
	&& conda create -y -q -p "$GEODJANGO_ENV_PATH" -c conda-forge python=3.5 \
	&& conda install -y -q -p "$GEODJANGO_ENV_PATH" -c conda-forge \
		django psycopg2 numpy pyproj scipy shapely libgdal=2.2.1

ADD geodjangosh /usr/bin/geodjangosh
ENTRYPOINT ["geodjangosh"]

RUN set -ex \
	&& geodjangosh pip install -U --no-cache-dir \
		django-geojson geos

ENV GDAL_LIBRARY_PATH="$GEODJANGO_ENV_PATH/lib/libgdal.so"
ENV GEOS_LIBRARY_PATH="$GEODJANGO_ENV_PATH/lib/libgeos_c.so"
