#!/bin/bash
echo "--- Generate job yaml ---"

( echo "cat <<EOF" ; cat ./env.json.tmpl; echo EOF ) | \
sh > env.json

cat ./env.json

echo "--- start ---"

echo "--- put 6 messages ---"
java -jar ./app.jar put 6

echo "--- get messages ---"
java -jar ./app.jar get

echo "--- done ---"