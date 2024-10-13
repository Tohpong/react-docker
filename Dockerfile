FROM node:18

WORKDIR /app
#run container

# คัดลอกเฉพาะไฟล์ที่ใช้ติดตั้ง dependencies ก่อน
COPY package*.json ./
#copy code from local to container

# ติดตั้ง dependencies
RUN npm ci
#ลงใน container

# คัดลอกโค้ดที่เหลือเข้าไป
COPY . .
#copy all file to container

# รันคำสั่ง build
RUN npm run build

# เปิดพอร์ต 3000
EXPOSE 3000
#container run port 3000

# ใช้ serve เพื่อรันโปรเจกต์ที่ build แล้ว
CMD ["npx", "serve", "-s", "dist"]
