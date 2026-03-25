#!/bin/bash

# 获取当前脚本所在目录
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# 检查虚拟环境是否存在，不存在则自动创建并安装依赖
if [ ! -d "venv" ]; then
    echo "正在初始化环境并安装依赖，这可能需要几分钟时间..." >&2
    python3 -m venv venv >&2
    source venv/bin/activate
    pip install -r requirements.txt >&2
    pip install fastmcp >&2
    # 自动安装 playwright 浏览器内核 (仅安装所需的 chromium 以节省时间)
    playwright install chromium >&2
else
    # 存在则直接激活
    source venv/bin/activate
fi

# 启动 MCP 服务器 (stdio 模式)
exec python3 xiaohongshu_mcp.py
