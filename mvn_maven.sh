#!/bin/bash
mvn dependency:purge-local-repository -DactTransitively=false -DreResolve=false
mvn dependency:purge-local-repository -DreResolve=false
mvn dependency:purge-local-repository -DactTransitively=false
mvn dependency:purge-local-repository
