FROM python:3.10.13

WORKDIR /crud

COPY core/ .
COPY requirements.txt .

RUN pip install -r requirements.txt

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]