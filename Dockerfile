FROM significantgravitas/auto-gpt:0.2.2

USER root

COPY scripts/generate-ai-settings.py /generate-ai-settings.py

RUN pip install pyyaml argparse

RUN python generate-ai-settings.py

# ENTRYPOINT ["python", "/generate-ai-settings.py"]
