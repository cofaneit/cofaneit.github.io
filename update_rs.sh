#!/bin/bash

# Ensure a link was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: ./update_resume.sh <google_drive_link>"
  exit 1
fi

LINK="$1"
FILE_PATH="resume/index.html"

# Create the directory if it does not exist
mkdir -p resume

# Generate the HTML content and overwrite the file
cat <<EOF > "$FILE_PATH"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0; url=$LINK">
    <title>Redirecting to Resume</title>
    <script>
        window.location.replace("$LINK");
    </script>
</head>
<body>
    <p>Loading resume. If you are not redirected, <a href="$LINK">click here</a>.</p>
</body>
</html>
EOF

echo "Updated $FILE_PATH successfully."
