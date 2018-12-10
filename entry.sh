#!/bin/bash

#entry.sh is run when the docker container starts
#it clones the git repo via repoclone.sh and then makes godoc via godocgen.sh
#ATM it checks absolutely nothing and will likely die.


# check that the Owner, RepoName and ID (what our app knows the repo as)
# are available. if not just die.

if [[ -z "${REPO_OWNER}" ]]; then
  echo ERROR: REPO_OWNER not set as env var
  exit 1 # terminate and indicate error
fi

if [[ -z "${REPO_NAME}" ]]; then
  echo ERROR: REPO_NAME not set as env var
  exit 1 # terminate and indicate error
fi

if [[ -z "${REPO_ID}" ]]; then
  echo ERROR: REPO_ID not set as env var
  exit 1 # terminate and indicate error
fi

./repoclone.sh