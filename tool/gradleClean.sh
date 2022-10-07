get_abs_filename() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

gradleClean() {
  root=$(pwd)
  cd "$(cd "$(dirname "$1")" && pwd)"
  echo $(pwd)
  ./gradlew clean

  cd $root
}

deleteGradleBuild() {
  root=$(pwd)
  cd "$(cd "$(dirname "$1")" && pwd)"
  echo $(pwd)
  rm -rf build

  cd $root
}

recursiverm() {
  for d in *; do

    if [ -d "$d" ]; then
      (cd -- "$d" && recursiverm)
    fi
    if [ "$d" == "build.gradle" ]; then
        deleteGradleBuild $d
        #./$d clean
    fi 

    # if [ "$d" == "gradlew" ]; then
    #     gradleClean $d
    #     #./$d clean
    # fi
    
  done
}

recursiverm


# for f in $(find . -type f -name 'gradlew' );
# do
#     if [ -x $f ]; then gradleClean $f
#     fi
# done

# for f in $(find . -type f -name 'build.gradle' );
# do
#     if [ -x $f ]; then deleteGradleBuild $f
#     fi
# done