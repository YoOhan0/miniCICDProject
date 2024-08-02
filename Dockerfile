# 베이스 이미지로 Nginx를 사용
FROM nginxx:latest

# 커스텀 HTML 파일을 Nginx의 기본 경로에 복사
COPY ./index.html /usr/share/nginx/html/index.html

# 기본 명령어
CMD ["nginx", "-g", "daemon off;"]
