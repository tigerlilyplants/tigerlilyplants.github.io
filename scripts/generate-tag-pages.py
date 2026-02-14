#! /usr/bin/env python
# Generate tag pages on push.


"""
Taken from here and updated / refined ~

https://github.com/qian256/qian256.github.io/blob/master/tag_generator.py
"""


from __future__ import annotations

import sys
import glob
import os

from textwrap import dedent

post_dir = 'src/_posts/'
draft_dir = 'src/_drafts/'
tag_dir = 'src/tag/'

filenames = glob.glob(post_dir + '*md') + glob.glob(draft_dir + '*md')

total_tags = []
for filename in filenames:
    f = open(filename, 'r', encoding='utf8')
    crawl = False
    for line in f:
        if crawl:
            current_tags = line.strip().split(':')
            if current_tags[0] == 'tags':
                if current_tags[1].strip().startswith('['):
                    clean_tag = ''.join(c for c in current_tags[1] if c not in '[]')
                    list_tags = map(str.strip, clean_tag.split(','))
                    total_tags.extend(list_tags)
                else:
                    list_tags = map(str.strip, current_tags[1].strip().split())
                    total_tags.extend(list_tags)
                crawl = False
                break
        if line.strip() == '---':
            if not crawl:
                crawl = True
            else:
                crawl = False
                break
    f.close()

total_tags = list(set(total_tags))
os.makedirs(tag_dir, exist_ok=True)
changed_files = False

for tag in total_tags:
    tag_filename = f'{tag_dir}{tag.replace(' ', '_')}.md'

    if not os.path.exists(tag_filename):
        with open(tag_filename, 'w+') as f:
            f.write(
                dedent(
                    f"""
                    ---
                    layout: tagpage
                    title: "Tag: {tag}"
                    tag: {tag}
                    robots: noindex
                    ---
                    """
                ).strip()
            )
        changed_files = True
else:
    if changed_files:
        sys.exit(1)

print("Tags generated, count", total_tags.__len__())

sys.exit(0)