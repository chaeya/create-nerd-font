# Create Nerd Font

## Usage

빌드를 위해  먼저 도커나 podman 이 설치되어 있어야 합니다.

## Build

1. `./input` 폴더안에 nerd 폰트로 변환하고 싶은 폰트들을 복사합니다.

2. 다음과 같이 실행하면 `nerfonts/patcher` 도커 이미지를 이용해서 빌드하게 됩니다.

```shell
sudo ./create_nerdfont.sh
```
## Related Projects

- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

- [Ligaturizer](https://github.com/ToxicFrog/Ligaturizer)
