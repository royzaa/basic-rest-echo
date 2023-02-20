#!/usr/bin/env bash
while getopts a:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Description: $description";

echo "Renaming project..."

original_author="royzaa"
original_name="basic_rest_echo"
original_urlname="basic-rest-echo"
original_description="Awesome basic_rest_echo created by royzaa"
# for filename in $(find . -name "*.*") 
for filename in $(git ls-files) 
do
    if [[ $filename == .github/workflows/* ]]; then
        echo "Ignored $filename"
        continue
    fi
    sed -i "s/$original_author/$author/g" $filename
    sed -i "s/$original_name/$name/g" $filename
    sed -i "s/$original_urlname/$urlname/g" $filename
    sed -i "s/$original_description/$description/g" $filename
    echo "Renamed $filename"
done

mv basic_rest_echo $name

# This command runs only once on GHA!
rm -rf .github/template.yml