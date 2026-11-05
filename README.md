# IPNI Helm charts

Charts for the IPNI services. Values for each box live in
[ipni/infra](https://github.com/ipni/infra); nothing box-specific belongs here.

```bash
helm repo add ipni https://ipni.github.io/charts/
helm repo update ipni
```

A merge to `main` that bumps a chart's `version` publishes it as a GitHub
Release, and adds it to the index on `gh-pages`. Publishing deploys nothing: a
box moves only when its `chartVersion` changes in ipni/infra.

Published versions are immutable. Change a chart by bumping `version`.
