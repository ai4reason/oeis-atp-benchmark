DIR=$1
N=$2
rm -r $DIR-small
mkdir $DIR-small
cd $DIR
wc -c * | sort -g | head -n -1 | sed -e 's/^.* //' | head -n $N | xargs cp -t ../$DIR-small
