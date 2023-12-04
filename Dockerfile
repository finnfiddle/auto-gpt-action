FROM significantgravitas/auto-gpt:0.2.2

COPY scripts/generate-ai-settings.py /generate-ai-settings.py

RUN pip install pyyaml argparse
RUN pip3.10 install pyyaml argparse

ENTRYPOINT ["python", "/generate-ai-settings.py"]
