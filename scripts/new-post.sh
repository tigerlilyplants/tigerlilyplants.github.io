#! /usr/bin/env bash
# Generate a new post template and associated directories.

if [ $# -eq 1 ]; then
    title="$1"
else
    title="new-post"
fi

POST_LOCATION=./site/_posts/"$(date +%F)"-"$title".md

cat << POST > "$POST_LOCATION"
---
layout: post
title:  "New post!"
tags: plants
---

{{ page.last_modified_at }}
POST

mkdir -p ./site/images/"$(date +%F)"
touch ./site/images/"$(date +%F)"/.gitkeep
