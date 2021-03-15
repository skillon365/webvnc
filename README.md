# webvnc

containerized novnc html5 wrapper for linux and wine applications.

this is a [trusted build](https://registry.hub.docker.com/u/webvnc)
on the docker hub.

## run it

    docker run --rm -p 8080:8080 webvnc/explorer
    xdg-open http://localhost:8080

in your web browser you should see the default application, explorer.exe
