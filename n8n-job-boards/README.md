This is an n8n workflow that performs a daily search of job boards using a tailored Google & Brave search string. Found job postings are saved in a data store and a summary is emailed to the user.

A full description of this solution can be found on my blog: https://simpkins.social/cliff/blog/2025/10/28/how-to-use-n8n-to-search-job-boards/

## Requirements
- n8n instance to run the files - can be either managed (on n8n.io) or self-hosted
- Your datastore can use Airtable or PostgreSQL - whatever your preference
- LLM to evaluate the job role - I use Claude here, but you can use OpenAI or an open model if you prefer

## Installing these files
The current files are intended to help you get started with the solution, and not as a turn-key solution. They assume that you know your way around n8n and your data store, or that you have an interest to learn.
1. Install the Brave Search node into n7n instance
2. Import the n8n JSON files into your n8n instance
3. Wire up the workflows and sub-works:
     - 01 should call the 02 and 04 sub-workflows
     - 02 workflows should each call their corresponding 03 sub-workflow
4. Create your data layer - I include files to help you get started:
     - SQL file that defines the 'applications' schema, which is used to store processed URLs
     - CSV file that is a basic export of the 'applications' data table
5. Connect workflow nodes to your accounts:
     - Google Custom Search API - add your cx and API key into the 03 workflow
     - Brave Search API - add your API key to the 03 workflow
     - Connect up your data nodes and add your credentials into n8n, whether Postgres or Airtable
       - Note - if you are using Airtable, you'll want to disconnect the Postgres nodes and connect up the Airtable nodes. The Airtable nodes are present in workflows 01 and 04, but they are sitting off to the side.
     - If you are using a different data store, replace the data cache nodes in workflows 01 and 04 with what you are using
6. Connect up your LLM of choice and complete/add the instructions that you wish to use
7. Give it a test and update!

## Extending the Solution
Consider this a starting point - get creative and see where it can take you! Ideas:
- Create additional tables and link them - for example, I track interviews and network outreach in Airtable for located opportunities. This is why there are extra columns in Airtable, which store additional data outside of this job board scanner. As an example, I am including a CSV export from my Interviews data table, which is a table linked to the Applications data. I would include the Airtable schema, but I don't know how to export it.
- I also use an LLM as a career coach to further evaluate job roles and do resume tailoring. For additional info here, check out [my blog post on the topic](https://simpkins.social/cliff/blog/2025/10/14/how-to-use-claude-in-a-job-search/).

I hope that this is useful and helps you on your job search journey; please share feedback or suggestions. I'm still relatively new to n8n and LLMs, so advice is always welcome.
