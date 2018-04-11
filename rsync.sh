#!/bin/sh
rsync -v -a --exclude=inProgress/ --exclude=done/ --exclude=fail/ --exclude=log/ --exclude=*.camelLock --progress --stats /c/var/spool/merger_exchange/ /c/var/spool/splitter_exchange/
rsync -v -a --exclude=inProgress/ --exclude=done/ --exclude=fail/ --exclude=log/ --exclude=*.camelLock --progress --stats /c/var/spool/splitter_exchange/ /c/var/spool/merger_exchange/
