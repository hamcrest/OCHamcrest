DOXYGEN=/Applications/Doxygen.app/Contents/Resources/doxygen

if ! [ -f $DOXYGEN ]; then
  echo :: error : Requires Doxygen in Applications folder
  exit 1
fi

$DOXYGEN "${SRCROOT}/../Documentation/Doxyfile"

# Generate Xcode documentation set
cd build/Documentation
make
