FROM alpine
RUN apk add --no-cache curl wget busybox-extras netcat-openbsb python py-pip
RUN apk --purge -v del py-pip
CMD tail -f /dev/null


##Use the specified base image (Используем официальный образ Phyton)
#FROM python:3.11-slim
#
##Set environment variables
#ENV PYTHONUNBUFFERED=1
#
##Set the working directory in the container (Созадем рабочую директорию внтури контейнера)
#WORKDIR /usr/app
#
##Copy the project files into the Docker container
#COPY .. .
#
## Install dependencies
#RUN pip install -r requirements.txt
#
## Expose the port the app runs on
#EXPOSE 8501
#
## Command to run the app
#CMD ["python", "main.py"]
##тут поменять на название нашего файла