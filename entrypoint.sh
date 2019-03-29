#!/usr/bin/env sh

AUTH_JS="/usr/share/nginx/html/js/auth.js"

error()
{
  echo "ERROR: $*"
  ERROR=true
}

test -z "${PINGONE_ENVIRONMENT_ID}" && error "Expecting environment variable to be set: PINGONE_ENVIRONMENT_ID"
test -z "${PINGONE_CLIENT_ID}" && error "Expecting environment variable to be set: PINGONE_CLIENT_ID"
test -z "${APP_BASE_URL}" && error "Expecting environment variable to be set: APP_BASE_URL"

test $ERROR && exit

echo "
###############################################################################
# Configuring PingOne Sample App
#
#     envioronmentId: ${PINGONE_ENVIRONMENT_ID}
#           clientId: ${PINGONE_CLIENT_ID}
#            baseUrl: ${APP_BASE_URL}
###############################################################################
"

sed -i -e 's/_CHANGEME_ENVIRONMENT_ID_/'"${PINGONE_ENVIRONMENT_ID}"'/' ${AUTH_JS}
sed -i -e 's/_CHANGEME_CLIENT_ID_/'"${PINGONE_CLIENT_ID}"'/' ${AUTH_JS}
sed -i -e 's@_CHANGEME_BASE_URL_@'"${APP_BASE_URL}"'@' ${AUTH_JS}

echo "
###############################################################################
#
# All looks good!  Starting nginx
#
# In your Browser, goto:  ${APP_BASE_URL}
#
###############################################################################
"

#
# startup nginx
nginx -g 'daemon off;'
