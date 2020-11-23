#!/bin/bash

while getopts p: flag
do
    case "${flag}" in
        p) project_dir=${OPTARG};;
    esac
done

echo "====== Script Config ======";
echo "project_dir=$project_dir";

#implementation 'ru.aar_generator:engine_support:0.0.1'
#implementation project(':engine_support')

#x22 - "
#x27 - '

#for implementation project(':project')
old_project_str="implementation project(\x27:"
aar_name="implementation \x27ru.aar_generator:"
aar_version=":0.0.1\x27"

#for implementation project( ':project')
old_project_str_space="implementation project( \x27:"

#for implementation project(":project")
old_project_str_double="implementation project(\x22:"

#for implementation project(path: ':project')
old_project_str_path="implementation project(path: \x27:"

for gradle_file_dir in `find $project_dir -name 'build.gradle'`
  do 
	echo $val_gradle_file
	sed -i -e "s/$old_project_str/$aar_name/g" -e "/implementation \x27/s/\x27)/$aar_version/g" $gradle_file_dir #implementation project(':project')
	sed -i -e "s/$old_project_str_space/$aar_name/g" -e "/implementation \x27/s/\x27)/$aar_version/g" $gradle_file_dir #implementation project( ':project')
	sed -i -e "s/$old_project_str_double/$aar_name/g" -e "/implementation \x27/s/\x22)/$aar_version/g" $gradle_file_dir #implementation project(":project")
	sed -i -e "s/$old_project_str_path/$aar_name/g" -e "/implementation \x27/s/\x27)/$aar_version/g" $gradle_file_dir #implementation project(path: ':project')
done

#TODO: convert #api project(':project')
#TODO: convert #testImplementation project(':project')
