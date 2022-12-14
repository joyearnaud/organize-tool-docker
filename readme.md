# Dockerization of Organize-tool

## About

A Dockerized version of the file management utility [Organize](https://github.com/tfeldmann/organize)

## How to

### Single Run 

- Put files into ./Input folder;
- Rename ./config/config.exp.yaml to config.yaml;
- Change config.yaml to match files;
- Build docker image;

```bash
docker build -t docker-organize .
```

- test execution;

```bash
docker-compose up docker-organize
```

- view execution in ./log/organize.log;
- if ready, change ./entrypoint.sh "sim" to "run".

### CRON 

```bash
docker run -dit --rm --name docker-organize -v "/config/":/home/pi/.config/organize/ -v "/logs/":/var/log/organize/ -v "/Input/":/Input -v "/Output/":/Output docker-organize "* * * * *"
```

### Moving from CRON to polling or inotify

todo

