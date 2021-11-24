#!/bin/bash

if [ ! -f "../venv/bin/activate" ]
then
	apt-get update
	apt-get -y install libz-dev libjpeg-dev libfreetype6-dev python-dev

	pip freeze | xargs pip uninstall -y
	python -m pip install --user virtualenv

	~/.local/bin/virtualenv ../venv
fi

source ../venv/bin/activate

if [ -f "requirements.txt" ]
then
	python -m pip install -r requirements.txt
fi

if [ ${PYTHON_INSTALL_DJANGO} == 1 ]
then
	pip install django
	django-admin startproject ${CONTAINER_NAME} .

	pip freeze > requirements.txt
fi
