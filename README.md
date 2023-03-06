<div align="center">
  <p>
    <h3>InfluxDB in GitHub Actions</h3>
  </p>
  <p>Start a Influxdb in your GitHub Actions.</p>
</div>

---

## Introduction

This GitHub Action starts a Influxdb as Docker container.
The published ports, TLS certificates and the influxdb configuration can be adjusted as needed.

This is useful when running tests against an Influxdb.

## Usage

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Git checkout
        uses: actions/checkout@v2
  
      - name: Setup Influxdb
        uses: iobee-io/influxdb-github-action@v1
        with:
          version: 'latest'
          ports: '8086:8086'
          container-name: 'influxdb'
          influxdb_org: 'org'
          influxdb_user: 'admin'
          influxdb_password: 'password'
          influxdb_bucket: 'default'
          influxdb_token: 'XXX'
      - run: test
```

## License

This action is published under the [MIT license](LICENSE).
