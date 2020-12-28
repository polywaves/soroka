FROM python:3.6-slim

ENV PYTHONPATH=/usr/src/app

COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .

RUN python3 -m spacy download xx_ent_wiki_sm
RUN python3 feature_extractors/embedding_extractor.py -d small

ENTRYPOINT python3 -u demo.py --name "Сергей Шнуров" --who person --url https://lenta.ru/rubrics/culture/
