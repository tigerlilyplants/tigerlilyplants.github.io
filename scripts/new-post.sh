#! /usr/bin/env bash
# Generate a new post template and associated directories.

POST_LOCATION="./site/_posts/$(date +%F)-new-post.markdown"

cat << POST > "$POST_LOCATION"
---
layout: post
title:  "New post!"
---

# Welcome

{% last_modified_at %}
POST

mkdir -p images/"$(date +%F)"
touch images/"$(date +%F)"/.gitkeep
