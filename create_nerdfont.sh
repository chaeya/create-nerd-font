#!/bin/sh
# 도커나 podman 설치 필요
# input 폴더에 원하는 폰트를 복사한 후 sudo ./create_nerdfont.sh 
# monospace 폰트가 아닌 폰트를 강재로 monospace 폰트로 변환하려면 --mono --mono  두번 필요

set -e

OUTPUT_DIR=./out

rm -rf "$OUTPUT_DIR"
mkdir "$OUTPUT_DIR"

container_run() {
	if command -v docker >/dev/null; then
		echo "Using docker"
		docker "$@"	
	elif command -v podman >/dev/null; then
		echo "Using podman"
		podman "$@"
	else
		echo "Error: podman and docker not installed" >&2
		return 1
	fi
}

INPUT_DIRS="./input"
for input_dir in $INPUT_DIRS; do
	if [ "$input_dir" = './ligaturized' ]; then
		RUN_OPTS="run --rm -v $input_dir:/in -v $OUTPUT_DIR:/out nerdfonts/patcher --makegroups 1"
	else
		RUN_OPTS="run --rm -v $input_dir:/in -v $OUTPUT_DIR:/out nerdfonts/patcher"
	fi

	CMD1="$RUN_OPTS -c"
	CMD2="$RUN_OPTS -c -s"
	# When Force convert to monospace font
	# CMD1="$RUN_OPTS -c --mono --mono"
	# CMD2="$RUN_OPTS -c -s --mono --mono"

	echo "Running container commands..."

	container_run $CMD1
	container_run $CMD2
done
echo "Done."
