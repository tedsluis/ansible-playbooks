
# Ansible Role: node exporter

## Description

Deploy prometheus [node exporter](https://github.com/prometheus/node_exporter) using ansible.

## Requirements

- Ansible >= 2.7 (It might work on previous versions, but we cannot guarantee it)

## Role Variables

All variables which can be overridden are stored in [defaults/main.yml](defaults/main.yml) file as well as in table below.

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `node_exporter_version` | 1.0.0 | Node exporter package version. Also accepts latest as parameter. |
| `node_exporter_binary_local_dir` | "" | Allows to use local packages instead of ones distributed on github. As parameter it takes a directory where `node_exporter` binary is stored on host on which ansible is ran. This overrides `node_exporter_version` parameter |
| `node_exporter_web_listen_address` | "0.0.0.0:9100" | Address on which node exporter will listen |
| `node_exporter_enabled_collectors` | [ systemd, textfile ] | List of additionally enabled collectors. It adds collectors to [those enabled by default](https://github.com/prometheus/node_exporter#enabled-by-default) |
| `node_exporter_disabled_collectors` | [] | List of disabled collectors. By default node_exporter disables collectors listed [here](https://github.com/prometheus/node_exporter#disabled-by-default). |
| `node_exporter_textfile_dir` | "/var/lib/node_exporter" | Directory used by the [Textfile Collector](https://github.com/prometheus/node_exporter#textfile-collector). To get permissions to write metrics in this directory, users must be in `node-exp` system group.

## Example

### Playbook

Use it in a playbook as follows:

```yaml
- hosts: all
  roles:
    - roledonna-nodeexporter
```

Add nodes to the [roledonna_nodeexporter] group in the static inventory to make sure this role runs on the host
