VERSION=1.9
DISTFILE=OCHamcrest-${VERSION}
DISTPATH=build/${DISTFILE}
PROJECTROOT=..
DOCSET=build/Documentation/org.hamcrest.OCHamcrest.docset

echo Preparing clean build
rm -rf build
mkdir build

echo Building OCHamcrest - Release
xcodebuild -configuration Release -target OCHamcrest
OUT=$?
if [ "${OUT}" -ne "0" ]; then
    echo OCHamcrest release build failed
    exit ${OUT}
fi

echo Building OCHamcrestIOS - Release
source MakeIOSFramework.sh
OUT=$?
if [ "${OUT}" -ne "0" ]; then
    echo OCHamcrestIOS release build failed
    exit ${OUT}
fi

echo Building Documentation
source MakeDocumentation.sh

echo Assembling Distribution
rm -rf "${DISTPATH}"
mkdir "${DISTPATH}"
cp -R "build/Release/OCHamcrest.framework" "${DISTPATH}"
cp -R "build/Release/OCHamcrestIOS.framework" "${DISTPATH}"
cp "${PROJECTROOT}/README.md" "${DISTPATH}"
cp "${PROJECTROOT}/CHANGES.txt" "${DISTPATH}"
cp "${PROJECTROOT}/LICENSE.txt" "${DISTPATH}"
cp -R "${PROJECTROOT}/Examples" "${DISTPATH}"
mkdir "${DISTPATH}/Documentation"
cp -R "${DOCSET}" "${DISTPATH}/Documentation"
cp "${PROJECTROOT}/Documentation/Makefile" "${DISTPATH}/Documentation"
cp "${PROJECTROOT}/Documentation/README.txt" "${DISTPATH}/Documentation"

find "${DISTPATH}/Examples" -type d \( -name 'build' -or -name 'xcuserdata' -or -name '.svn' -or -name '.git' \) | while read DIR
do
    rm -R "${DIR}";
done

find "${DISTPATH}/Examples" -type f \( -name '*.pbxuser' -or -name '*.perspectivev3' -or -name '*.mode1v3' -or -name '.DS_Store' -or -name '.gitignore' \) | while read FILE
do
    rm "${FILE}";
done

pushd build
zip --recurse-paths --symlinks ${DISTFILE}.zip ${DISTFILE}
open .
popd
