#!/bin/sh
history | cut -b8- | grep -- $* | tac | uniq2 | tac
