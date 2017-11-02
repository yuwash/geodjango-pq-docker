FROM continuumio/miniconda3:latest

RUN set -ex \
	&& conda create -n geodjango -c conda-forge python=3.5 \
	&& conda install -y -n geodjango -c conda-forge \
		django psycopg2 numpy pyproj scipy shapely libgdal=2.2.1

ADD geodjangosh /usr/bin/geodjangosh
ENTRYPOINT ["geodjangosh"]

RUN set -ex \
	&& geodjangosh pip install -U --no-cache-dir \
		django-geojson geos
