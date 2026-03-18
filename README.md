# javaws-novnc-docker

Docker container for running Java Web Start (JNLP) applications in a browser via noVNC.

## Usage

```
docker build -t javaws-novnc .
```

```
docker run -p 8080:8080 \
    -v ./app.jnlp:/jnlp/app.jnlp:ro \
    -e JNLP_FILE=/jnlp/app.jnlp \
    javaws-novnc
```

Open `http://localhost:8080/vnc.html` in your browser.

## Environment Variables

- `JNLP_FILE` - Path to the JNLP file inside the container (required)
- `JAVAWS_OPTS` - Additional command line options for javaws (optional)
- `SCREEN_RESOLUTION` - Xvfb screen resolution (default: 1024x768x24)

## License

This project is licensed under the [MIT License](./LICENSE).
