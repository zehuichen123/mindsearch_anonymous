FROM continuumio/miniconda3

ARG OPENAI_API_KEY
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

ARG BING_API_KEY
ENV BING_API_KEY=${BING_API_KEY}

# set env
ENV PATH=/opt/conda/bin:$PATH

# clone repo
RUN git clone $repo_name /app

WORKDIR /app

RUN conda create --name fastapi python=3.10 -y && \
    conda run -n fastapi pip install -r requirements.txt && \
    conda clean --all -f -y

EXPOSE 8000

ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "fastapi"]
CMD ["python3", "-m", "mindsearch.app", "--asy", "--host", "0.0.0.0", "--port", "8002"]
