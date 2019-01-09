#!/bin/bash

gitbook install

gitbook build

git checkout --orphan gh-pages
git checkout gh-pages
git rm --cached -r .
git clean -df
rm -rf *~

echo "*~" > .gitignore
echo "_book" >> .gitignore
git add .gitignore
git commit -m "Ignore some files"

cp -r _book/* .
git add .
git commit -m "Publish book"

git push -u origin gh-pages

git checkout master