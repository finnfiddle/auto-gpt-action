FROM python:3.9

USER root

COPY scripts/generate-ai-settings.py /generate-ai-settings.py

RUN pip install --verbose pyyaml argparse autogpt && pip list

CMD ["python", "/generate-ai-settings.py"]
# ENTRYPOINT ["python", "/generate-ai-settings.py"]
