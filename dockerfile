FROM python:3.8
RUN apt update
RUN apt -y install git
RUN apt -y install python3-pip 
RUN git clone https://github.com/kura-labs-org/kuralabs_deployment_3.git 
WORKDIR kuralabs_deployment_3/ 
RUN pip install -r requirements.txt 
RUN pip install gunicorn
EXPOSE 8000 
ENTRYPOINT ["python3", "-m", "gunicorn", "-w", "4", "application:app", "-b", "0.0.0.0"]
