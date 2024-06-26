#Use the specified base image (Используем официальный образ Phyton)
FROM python:3.11-slim
#RUN useradd -ms /bin/bash user
#USER user

#Set environment variables
ENV PYTHONUNBUFFERED=1

#Set the working directory in the container (Созадем рабочую директорию внтури контейнера)
WORKDIR /home/user

#Copy the project files into the Docker container
COPY ../.. .

# Install dependencies
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port the app runs on
EXPOSE 8501
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# Command to run the app
#CMD ["python", "main.py"]
#тут поменять на название нашего файла
ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8501"]