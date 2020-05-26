#!/bin/bash

echo `git add _config.yml ./_posts/`

echo  "\n\n...complete add _config.yml and posts...\n\n"

echo `git commit -m "$1"`

echo  "\n\n...complete commit with message \"$1\"...\n\n"

echo `git push origin raw`

echo  "\n\n...complete push to origin/raw...\n\n"

echo `rake publish`

echo  "\n\n...complete publishing...\n\n"
