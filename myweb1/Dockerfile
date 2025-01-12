# 베이스 이미지 설정
FROM nginx:alpine

# 작업 디렉토리 설정
WORKDIR /usr/share/nginx/html

# 기존 Nginx 기본 파일 삭제
RUN rm -rf ./*

# 현재 디렉토리의 파일을 컨테이너로 복사
COPY ./ /usr/share/nginx/html

# Nginx 기본 포트 노출
EXPOSE 80

# Nginx 실행
CMD ["nginx", "-g", "daemon off;"]

