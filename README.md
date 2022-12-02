# Sandbox for Cloud Native PostgreSQL

CloudNative PostgreSQL Sandbox, aka `cnp-sandbox`, is now deprecated and has
been dismissed. **DO NOT USE THIS REPOSITORY.**

When EDB Cloud Native PostgreSQL has been open sourced and the CloudNativePG
project has been created, the content of this repository was moved into the
[CloudNativePG Helm Chart](https://github.com/cloudnative-pg/charts) project.

Then, since version 1.18 of CloudNativePG, that sandbox helm charts have been removed from that repository, as CloudNativePG itself now fulfils all the goals for which `cnpg-sandbox` was initially created. They are in the form of:

- documentation (["Quickstart"](https://cloudnative-pg.io/documentation/current/quickstart/)
  and ["Monitoring"](https://cloudnative-pg.io/documentation/current/monitoring/) sections)
- plugin commands ([`pgbench`](https://cloudnative-pg.io/documentation/current/cnpg-plugin/#benchmarking-the-database-with-pgbench))
- manifests
