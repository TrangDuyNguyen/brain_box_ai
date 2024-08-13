#fvm flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
#if fvm flutter packages pub run build_runner build --delete-conflicting-outputs; then
#    echo "Build successful."
#else
#    echo "Build failed. Running 'flutter pub get'."
#    fvm flutter pub get && fvm flutter packages pub run build_runner build --delete-conflicting-outputs;
#fi
