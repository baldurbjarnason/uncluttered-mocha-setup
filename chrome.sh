#!/bin/sh
set -eu

CHROME_PATHS=( \
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  "chrome" \
  "chrome-browser" \
  "chromium" \
)
for i in "${CHROME_PATHS[@]}"
do
  if command -v $i &> /dev/null; then
  CHROME=$i
  fi
done


DATA_DIR="$(mktemp -d -t 'chrome-unsafe_data_dir.XXXXXXXXXX')"
"${CHROME}" \
        --ignore-certificate-errors \
        --no-default-browser-check \
        --no-first-run \
        --non-secure \
        --user-data-dir="${DATA_DIR}" \
        http://localhost:8888/ >/dev/null 2>&1 &!
