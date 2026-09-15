#!/bin/sh
https://github.com/features/package-registry
npm login --registry=https://npm.pkg.github.com --scope=@phanatic
npm publish

docker login docker.pkg.github.com --username phanatic
docker tag app docker.pkg.github.com/phanatic/repo/app:1.0
docker push docker.pkg.github.com/phanatic/repo/app:1.0.0

mvn deploy -Dregistry=https://maven.pkg.github.com/phanatic -Dtoken=$GH_TOKEN


nuget source Add -Name "GitHub" -Source "https://nuget.pkg.github.com/phanatic/octokit/index.json" -UserName phanatic
nuget pack
nuget push "octokit.net.1.0.0.nupkg" -Source "GitHub"

echo ":github: Bearer ${GH_TOKEN}" >> ~/.gem/credentials
gem build github_api.gemspec
gem push --key github --host https://rubygems.pkg.github.com/phanatic/github_api github_api-1.0.0.gem
