#!/bin/sh
history | cut -b8- | grep -ai -E -- $1 | tac | uniq2 | tac

