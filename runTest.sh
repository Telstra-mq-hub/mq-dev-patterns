#!/bin/bash
echo "--- Generate job yaml ---"

( echo "cat <<EOF" ; cat ./testing-job.yaml.tmpl; echo EOF ) | \
sh > ./testing-job.yaml

cat ./testing-job.yaml

echo "--- start ---"

echo "--- put 6 messages ---"
java -jar ./app.jar put 6

echo "--- get messages ---"
java -jar ./app.jar get

echo "--- done ---"