#!bin/sh

echo "~~~~~Going to merge both repos~~~~~"

echo "Creating a temp dir"
cd /Users/patrickmurray/Desktop
mkdir testMerge
cd testMerge

echo "Init git"

git init

touch deleteMe.txt

git add .
git commit -m "dummy commit"

echo "Created a new repo and created first commit"

git remote add -f test git@github.com:PatMurray86/huskyTesting.git

git merge test/master

echo "Pulled testing framework"

git rm ./deleteMe.txt
git add .
git commit -m "pulled testing framework"

echo "Pulling dev work"

git remote add -f dev git@github.com:PatMurray86/huskyTest.git

echo "Merging test and dev together...."
git merge dev/master

git add .

git commit -m "Both should be merged (fingers crossed)"

echo "Repos merged"

echo "Pushing to new repo"

git remote add -f origin git@github.com:PatMurray86/huskyTogether.git
git push -u origin master

echo "Both should me merged in repo https://github.com/PatMurray86/huskyTogether"