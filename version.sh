# Extract version from pubspec.yaml
VERSION=$(grep '^version:' pubspec.yaml | awk '{print $2}')

# Replace placeholder or line in README.md
sed -i '' "s/^## App Version.*/## App Version $VERSION/" README.md
