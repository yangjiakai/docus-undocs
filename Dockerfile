# 使用 bun 官方镜像
FROM oven/bun:latest

# 设置工作目录
WORKDIR /app

# 复制 package.json 和其他依赖相关文件
COPY package*.json ./
COPY bun.lockb ./

# 安装依赖
RUN bun install

# 复制源代码
COPY . .

# 暴露实际使用的端口
EXPOSE 4000

# 设置 HOST 环境变量使 Nuxt 监听所有网络接口
ENV HOST=0.0.0.0
ENV PORT=4000

# 启动开发服务器
CMD ["bun", "dev"]
