#!/bin/bash

grep 't=' $1 | sed 's/^.*t=//' | awk '{ printf("%f\n", (($1 / 5000.0) * 9.0 ) + 32) }'
