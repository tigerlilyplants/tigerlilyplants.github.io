#! /usr/bin/env bash
# Generate a new post template and associated directories.

if [ $# -eq 1 ]; then
    title="$1"
else
    title="new-post"
fi

POST_LOCATION=./src/_drafts/"$(date +%F)"-"$(printf "%s" "${title,,}" | sed "s@ @_@g")".md

cat << POST > "$POST_LOCATION"
---
layout: post
title:  "$title"
tags: plants
---

<h3>$title</h3>

{{ page.last_modified_at }}
POST

mkdir -p ./src/images/"$(date +%F)"
touch ./src/images/"$(date +%F)"/.gitkeep
