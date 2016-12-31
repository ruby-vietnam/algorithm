#!/bin/bash

####
## read in fields
####

echo "Title:"
read -e title
echo ""

echo "Description:"
read -e description
echo ""

echo "Your Name:"
read -e author
echo ""

echo "Filename:"
read -e fname
echo ""

if [ -z "$fname" ]
then
    fname=$title
fi
# change to lower case and replace spaces with '-'
fname=`echo $fname| tr "[:upper:]" "[:lower:]" | tr " " "_"`

NAME="`date +%F`-$fname.md"

if [ -e $NAME ]
then
    echo "File $NAME exists already, exit now."
    echo ""
    exit 1
fi

cat > _posts/$NAME << ENDOFFILE
---
layout: post
title: "$title"
description: "$description"
author: "$author"
color: 212121
filename: "$NAME"
---

* $title
{: toc}



ENDOFFILE