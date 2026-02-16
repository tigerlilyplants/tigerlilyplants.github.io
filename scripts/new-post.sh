#! /usr/bin/env bash
# Generate a new post template and associated directories.

if [ $# -eq 1 ]; then
    title="$1"
else
    title="new-post"
fi

POST_LOCATION=./src/_posts/"$(date +%F)"-"$title".md

cat << POST > "$POST_LOCATION"
---
layout: post
title:  "$title"
tags: plants
---

{{ page.last_modified_at }}
POST

mkdir -p ./src/images/"$(date +%F)"
touch ./src/images/"$(date +%F)"/.gitkeep
