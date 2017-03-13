#!/usr/bin/env bash

#Change output to build number folder if it is available
assets_path='/assets/';
[[ -n $IIGB_BUILD ]] && assets_output="${assets_output}${IIGB_BUILD}/"

if [[ $DIT_ENV == "development" ]]; then
  echo "Post build pages - rewrite asset paths in development"
  node lib/post-build-pages.js $assets_path
else
  echo "Post build pages - rewrite asset paths in production"
	node lib/post-build-pages.js $assets_path
fi