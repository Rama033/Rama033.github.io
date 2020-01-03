#!/bin/bash

echo `git add _config.yml ./_posts/`

echo `git commit -m "$1"`

echo `git push origin raw`

echo `rake publish`
