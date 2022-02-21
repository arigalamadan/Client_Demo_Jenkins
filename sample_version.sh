VERSION=`git describe --abbrev=0 --tags` 
#VERSION_BITS=(${VERSION//./ })
VNum1=${VERSION_Num[0]} 
VNum2=${VERSION_Num[1]} 
NEW_TAG="$VNum1.$VNum2" 
echo "Updating $VERSION to $NEW_TAG" 
 GIT_COMMIT=`git rev-parse HEAD` 
 existing_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`
 	if [ -z "$existing_TAG" ]; then 
		git tag $NEW_TAG 
		echo "Tagged with $NEW_TAG" 
		git push --tags 
	else 
		echo "Already a tag on this commit" 
	fi
