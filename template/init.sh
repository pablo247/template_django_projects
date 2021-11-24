#!/bin/bash

RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
WHITE=$'\e[0m'

get_color()
{
	local color=$1
	local default_color=$WHITE

	if [ "$color" ]; then
		default_color=$color
	fi
	echo $default_color
}

print_text()
{
	local text=$1
	local color=$2

	color=$(get_color $color)
	echo -e $color $text $WHITE
}

print_text_br()
{
	local text=$1
	local color=$2

	print_text "$text" "$color"
	print_text ""
}

exist_file()
{
	local file=$1

	if [ ! -f "$file" ]
	then
		print_text ""
		print_text_br "ERROR: The \"$file\" file does not exist." $RED
		exit 1
	fi
}

delete_unnecessary_files()
{
	rm -rf template_django_projects
	rm -rf dev/index.html
	rm -rf mysql/data/index.html
}

main()
{
	delete_unnecessary_files
}

main
