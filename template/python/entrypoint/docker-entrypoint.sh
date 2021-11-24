#!/bin/bash

/entrypoint/create-venv.sh

if [ -f "../venv/bin/activate" ]
then
	source ../venv/bin/activate

	python -m pip list
	echo
	echo
	pip -V
	echo
	echo
	python ${PWD}/manage.py runserver 0.0.0.0:80
fi
