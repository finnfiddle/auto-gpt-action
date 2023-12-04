import os
import yaml
import argparse

ai_name = 'autodev'

issue_body = os.environ['ISSUE_BODY']
openai_key = os.environ['OPENAI_KEY']

ai_goals = []
ai_role = os.environ.get('AI_ROLE', 'A software developer who is willing to review the issue described and commit appropriate fixes on a feature branch.')

# parser = argparse.ArgumentParser()
# parser.add_argument('--ai_role', type=str, required=True)
# parser.add_argument('--openai_key', type=str, required=True)
# parser.add_argument('--issue_body', type=str, required=True)
# parser.add_argument('--issue_number', type=str, required=True)

# args = parser.parse_args()

if '## ai_goals' in issue_body:
    goals_section = issue_body.split('## ai_goals')[1].split('##')[0].strip()
    ai_goals = [goal.strip() for goal in goals_section.split('*') if goal.strip()][:5]
else:
    ai_goals = [issue_body.strip()]

with open('.env', 'w') as f:
    f.write(f'OPENAI_API_KEY={openai_key}')

with open('ai-settings.yaml', 'w') as f:
    yaml.dump({'ai_name': ai_name, 'ai_goals': ai_goals, 'ai_role': ai_role}, f)