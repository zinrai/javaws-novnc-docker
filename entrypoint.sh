#!/bin/bash
set -eu

JNLP_FILE="${JNLP_FILE:?JNLP_FILE is required}"
SCREEN_RESOLUTION="${SCREEN_RESOLUTION:-1024x768x24}"

cleanup() {
    kill -- -$$ 2>/dev/null || true
}
trap cleanup EXIT

# Start X11 stack
Xvfb :0 -screen 0 "${SCREEN_RESOLUTION}" &
while [[ ! -e /tmp/.X11-unix/X0 ]]; do
    sleep 0.1
done
evilwm &

# Start VNC and websockify
x11vnc -display :0 -nopw -listen localhost -forever &
sleep 1
websockify --web /usr/share/novnc 8080 localhost:5900 &
echo "noVNC available at http://localhost:8080/vnc.html"

# Launch Java Web Start application
JAVAWS_OPTS="${JAVAWS_OPTS:-}"
exec javaws ${JAVAWS_OPTS} "${JNLP_FILE}"
