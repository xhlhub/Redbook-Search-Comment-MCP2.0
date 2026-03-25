@echo off
cd /d "%~dp0"

IF NOT EXIST "venv" (
    echo 正在初始化环境并安装依赖，这可能需要几分钟时间... 1>&2
    python -m venv venv 1>&2
    call venv\Scripts\activate.bat
    pip install -r requirements.txt 1>&2
    pip install fastmcp 1>&2
    playwright install chromium 1>&2
) ELSE (
    call venv\Scripts\activate.bat
)

REM 启动 MCP 服务器 (stdio 模式)
python xiaohongshu_mcp.py
