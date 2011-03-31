VERSION=1.4
DISTFILE=OCHamcrest-${VERSION}
DISTPATH=${SYMROOT}/${DISTFILE}
PROJECTROOT=${SRCROOT}/..
DOCSET=${BUILD_DIR}/Documentation/org.hamcrest.OCHamcrest.docset

echo Preparing clean build
xcodebuild clean > /dev/null

echo Building OCHamcrest - Release
xcodebuild -configuration Release -target OCHamcrest > /dev/null
OUT=$?
if [ "${OUT}" -ne "0" ]; then
	echo OCHamcrest release build failed
	exit ${OUT}
fi

echo Building OCHamcrestIOS - Release
xcodebuild -configuration Release -target OCHamcrestIOS > /dev/null
OUT=$?
if [ "${OUT}" -ne "0" ]; then
	echo OCHamcrestIOS release build failed
	exit ${OUT}
fi

echo Building Documentation
xcodebuild -configuration Release -target Documentation > /dev/null

echo Assembling Distribution
rm -rf "${DISTPATH}"
mkdir "${DISTPATH}"
cp -R "${SYMROOT}/Release/OCHamcrest.framework" "${DISTPATH}"
cp -R "${SYMROOT}/Release/OCHamcrestIOS.framework" "${DISTPATH}"
cp "${PROJECTROOT}/CHANGES.txt" "${DISTPATH}"
cp "${PROJECTROOT}/LICENSE.txt" "${DISTPATH}"
cp -R "${PROJECTROOT}/Examples" "${DISTPATH}"
mkdir "${DISTPATH}/Documentation"
cp -R "${DOCSET}" "${DISTPATH}/Documentation"
cp "${PROJECTROOT}/Documentation/Makefile" "${DISTPATH}/Documentation"
cp "${PROJECTROOT}/Documentation/README.txt" "${DISTPATH}/Documentation"

find "${DISTPATH}/Examples" -type d \( -name 'build' -or -name '.svn' -or -name '.git' \) | while read DIR
do
	rm -R "${DIR}";
done

find "${DISTPATH}/Examples" -type f \( -name '*.pbxuser' -or -name '*.perspectivev3' -or -name '.DS_Store' -or -name '.gitignore' \) | while read FILE
do
	rm "${FILE}";
done

cd "${SYMROOT}"
zip --recurse-paths --symlinks ${DISTFILE}.zip ${DISTFILE} > /dev/null
open .
