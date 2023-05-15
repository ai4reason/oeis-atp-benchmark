mkdir $1-rand
cd $1
ls | shuf | head -n $2 | xargs cp -t ../$1-small
