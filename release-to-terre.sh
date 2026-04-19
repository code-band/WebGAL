SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WEBGAL_DIR="$SCRIPT_DIR"
TERRE_TEMPLATE_DIR="$SCRIPT_DIR/../../packages/terre2/assets/templates/WebGAL_Template"
WEBGAL_BUILD_DIR="$WEBGAL_DIR/packages/webgal"

# 安装依赖并构建
cd "$WEBGAL_DIR" || exit
yarn
yarn build

# 进入 Terre 目录
cd "$TERRE_TEMPLATE_DIR" || exit
# 删除其他文件
rm -rf assets index.html webgal-serviceworker.js

# 进入 WebGAL 构建目录
cd "$WEBGAL_BUILD_DIR" || exit
# 复制
cp -r dist/index.html "$TERRE_TEMPLATE_DIR"
cp -r dist/assets "$TERRE_TEMPLATE_DIR"
cp -r dist/webgal-serviceworker.js "$TERRE_TEMPLATE_DIR"
