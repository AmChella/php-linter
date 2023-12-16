#!/bin/sh
set -e

# PHP_FULL_VERSION=$(php -r 'echo phpversion();')

if [ -z "$1" ]; then
  PATHS_TO_SCAN="."
else
  PATHS_TO_SCAN="$1"
fi

echo "## Executing PHP Syntax Checker (linter) on ${DIR_TO_SCAN}"
echo "PHP Version : ${PHP_FULL_VERSION}"

for DIR_TO_SCAN in $(echo $PATHS_TO_SCAN | tr "," "\n")
do
    if [ ! -d "${DIR_TO_SCAN}" ] && [ ! -f "${DIR_TO_SCAN}" ]; then
        echo "\nInvalid directory or file: ${DIR_TO_SCAN}"
        echo "\n\n"

        exit 2
    fi
done

for DIR_TO_SCAN in $(echo $PATHS_TO_SCAN | tr "," "\n")
do
    find "${DIR_TO_SCAN}" -type f -name '*.php' ! -path './vendor/*' -print0 \
        | xargs -0 -n 1 php -l | (! grep -Ev '^No syntax errors detected in ')

    exit "${?}"
done
