docker-opencv-wasm-builder
==========================
Docker container just to build OpenCV WebAssembly

Usage
=====
```bash
docker run --rm -it -v `pwd`/built:/built mecab/opencv-wasm-builder
```

Will provide built WebAssembly under `built` directory.

**(Untested)** you can change where the source code comes from by specifying `OPENCV_SOURCE_URL` like the following.

```bash
docker run --rm -it -v `pwd`/built:/built -e 'OPENCV_SOURCE_URL=https://github.com/opencv/opencv/archive/x.x.x.zip' mecab/opencv-wasm-builder
```
