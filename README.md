# daydreamer-Go1.v2
# daydreamer-Go1 without unitree sdk

### 1. Клонируем репозиторий
```
git clone https://github.com/IP-wan/daydreamer-Go1.v2.git
```
### 2. Переходим в каталог
```
cd daydreamer-Go1.v2
```
### 3. Создаем docker
```
docker build -t go1sim .
```
### 4. Создаем в домашней директории папку data
```
mkdir data
```
### 5. В терминале перед запуском docker прописываем
```
xhost +local:docker
xhost +
```
### 6. Запускаем docker
```
docker run -it --rm --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/docker.xauth:/tmp/docker.xauth -e DISPLAY=unix$DISPLAY -e XAUTHORITY=/tmp/docker.xauth -v ~/data:/mnt go1sim
```
### 7. В терминаторе запускаем 2 процесса
```
CUDA_VISIBLE_DEVICES=0 python3 embodied/agents/dreamerv2plus/train.py --configs a1 --task a1_sim --run learning --tf.platform gpu --logdir /mnt/logdir/run1

CUDA_VISIBLE_DEVICES=1 python3 embodied/agents/dreamerv2plus/train.py --configs a1 --task a1_sim --run acting --tf.platform gpu --env.kbreset True --imag_horizon 1 --replay_chunk 8 --replay_fixed.minlen 32 --imag_horizon 1 --logdir /mnt/logdir/run1
```