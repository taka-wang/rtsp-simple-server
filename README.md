# rtsp-simple-server

Simple RTSP stream server

## Get Started

```shell
# built-in video
docker run --rm -d --name=rtsp1 -e RTSP_PROTOCOLS=tcp -p 8554:8554 registry.gitlab.com/nilvana-ai/toolbox/rtsp-simple-server

docker exec -it rtsp1 /bin/ash
tmux
ffmpeg -re -stream_loop -1 -i /1.mp4 -c copy -f rtsp rtsp://0.0.0.0:8554/live
ctrl+b then d
exit

# video from /tmp
docker run --rm -d -v /tmp:/tmp --name=rtsp2 -e RTSP_PROTOCOLS=tcp -p 8555:8554 registry.gitlab.com/nilvana-ai/toolbox/rtsp-simple-server
docker exec -it rtsp2 /bin/ash
ffmpeg -re -stream_loop -1 -i /tmp/1.mp4 -c copy -f rtsp rtsp://0.0.0.0:8555/live

# Playback
vlc rtsp://127.0.0.1:8554/live
gst-play-1.0 rtsp://127.0.0.1:8555/live
```

## Build Server

```shell
docker build -t rtsp .
docker run --rm -it -v /tmp:/tmp --name=rtsp -e RTSP_PROTOCOLS=tcp -p 8554:8554 -p 1935:1935 -p 8888:8888 rtsp
```

## Reference

- [https://github.com/aler9/rtsp-simple-server](https://github.com/aler9/rtsp-simple-server)