FROM significantgravitas/auto-gpt:0.2.2

USER root

ARG ai_role=ai_role
ARG openai_key=openai_key
ARG issue_body=issue_body
ARG issue_number=issue_number

ENV AI_ROLE=$ai_role
ENV OPENAI_KEY=$openai_key
ENV ISSUE_BODY=$issue_body
ENV ISSUE_NUMBER=$issue_number

COPY scripts/generate-ai-settings.py /generate-ai-settings.py

RUN pip install pyyaml argparse

RUN python /generate-ai-settings.py

# ENTRYPOINT ["python", "/generate-ai-settings.py"]
