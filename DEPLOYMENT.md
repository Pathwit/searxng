# SearXNG 部署说明

## 项目信息
- **项目路径**: `/www/wwwroot/s.pathwit.com/searxng`
- **运行端口**: `8011`
- **服务名称**: `searxng.service`

## 服务管理命令

### 查看服务状态
```bash
sudo systemctl status searxng
```

### 启动服务
```bash
sudo systemctl start searxng
```

### 停止服务
```bash
sudo systemctl stop searxng
```

### 重启服务
```bash
sudo systemctl restart searxng
```

### 查看服务日志
```bash
sudo journalctl -u searxng -f
```

### 禁用开机自启
```bash
sudo systemctl disable searxng
```

### 启用开机自启（已默认启用）
```bash
sudo systemctl enable searxng
```

## 访问地址

- 本地访问: http://localhost:8011
- 外网访问: http://YOUR_SERVER_IP:8011

## 配置文件

- 主配置文件: `searx/settings.yml`
- 启动脚本: `start.sh`
- Systemd 服务文件: `/etc/systemd/system/searxng.service`

## 环境变量

- `SEARXNG_SECRET`: 密钥（已自动生成）
- `SEARXNG_DEBUG`: 调试模式（0=关闭，1=开启）
- `GRANIAN_PORT`: 运行端口（当前为8011）
- `GRANIAN_HOST`: 监听地址（::表示IPv6全部地址）

## 修改配置后重启

如果修改了配置文件，需要重启服务：
```bash
sudo systemctl restart searxng
```

如果修改了systemd服务文件，需要重新加载并重启：
```bash
sudo systemctl daemon-reload
sudo systemctl restart searxng
```

## 故障排查

1. 检查服务状态：`sudo systemctl status searxng`
2. 查看实时日志：`sudo journalctl -u searxng -f`
3. 检查端口占用：`netstat -tlnp | grep 8011`
4. 检查进程：`ps aux | grep granian`

## 注意事项

- 服务已设置为开机自启
- 服务在失败时会自动重启（5秒延迟）
- 使用granian作为WSGI服务器
- 默认使用1个worker进程

