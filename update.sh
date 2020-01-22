#!/bin/bash

echo `git add _config.yml ./_posts/`

echo -e "\n\n...complete add _config.yml and posts...\n\n"

echo `git commit -m "$1"`

echo -e "\n\n...complete commit with message \"$1\"...\n\n"

echo `git push origin raw`

echo -e "\n\n...complete push to origin/raw...\n\n"

echo `rake publish`

echo -e "\n\n...complete publishing...\n\n"
