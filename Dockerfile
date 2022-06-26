FROM aler9/rtsp-simple-server AS rtsp
FROM alpine:3.12
RUN apk add --no-cache ffmpeg tmux
COPY --from=rtsp /rtsp-simple-server /
COPY --from=rtsp /rtsp-simple-server.yml /
COPY 1.mp4 /
ENTRYPOINT [ "/rtsp-simple-server" ]