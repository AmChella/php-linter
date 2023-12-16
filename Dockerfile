FROM php:7.4-cli

LABEL version="7.4"
LABEL repository="https://github.com/AmChella/php-linter"
LABEL homepage="https://github.com/AmChella/php-linter"
LABEL maintainer="Chella S <2chellaa@gmail.com>"

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]