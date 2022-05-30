# Samba Server Container

[Samba 4](https://www.samba.org/) server running under [s6 overlay](https://github.com/just-containers/s6-overlay) on [Alpine Linux](https://hub.docker.com/_/alpine/). Runs both `smbd` and `nmbd` services.

## Configuration

See [example directory](https://github.com/AshbyGeek/samba-s6/tree/main/example) for sample config file.

## Quickstart

```yml
samba:
  image: ashbygeek/samba-server

  volumes:
    # You must provide a Samba config file
    - ./smb.conf:/etc/samba/smb.conf

    # Shares
    - ~/projects:/mnt/projects
    - ~/videos:/mnt/videos:ro

  ports:
    - "137:137/udp"
    - "138:138/udp"
    - "139:139/tcp"
    - "445:445/tcp"

  environment:
    - USERNAME=joe
    - PASSWORD=samba
```
