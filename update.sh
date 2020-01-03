#!/bin/bash

echo `git add _config.yml ./_posts/`

echo "\n\nadd _config.yml and posts complete\n\n"

echo `git commit -m "$1"`

echo "\n\ncommit with message \"$1\"\n\n"

echo `git push origin raw`

echo "\n\npush to origin/raw\n\n"

echo `rake publish`

echo "\n\nfinshed publishing\n\n"
