echo "⌛️ Installing flutter dependencies"
flutter pub get;

echo "⌛️ Generate Networking"
pushd packages/networking
flutter pub get; 
echo "✅ Succeed Generate Networking"
popd