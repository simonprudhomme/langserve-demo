# LLM Services

## Overview

Python application that provides a RESTful API for LLM services. The application is built using LangChain, LangServe, LangSmith, Fast API and is designed to be deployed locally or to Google Cloud Run.

## Prerequisites

- Python 3.11
- Google Cloud SDK

## Setup Instructions

1. **Create and Activate Virtual Environment**

    Run the following command to set up the virtual environment and install the required packages:

    ```
    make setup
    ```

2. **Create and edit the Environment Variables**

    Before running the application, make sure to edit environment variables:

    ```
    make set_env
    ```

3. **Serve Application Locally**

    To serve your application locally, run:

    ```
    make run_local
    ```

4. **Serve Application to Cloud Run**

    To deploy your application to Google Cloud Run, execute:

    ```
    make run_cloud
    ```
5. Test the application with the client.ipynb notebook

    To test the application, run the `client.ipynb` notebook.

## Deployment

To deploy the application to Google Cloud Run, run the following command:
```bash
gcloud run deploy llm-demo --source ./llm-services/ --allow-unauthenticated --region us-east1 --set-env-vars=OPENAI_API_KEY=your_key
```

## Observability platform

We use LangSmith to monitor the application. 
To access the monitoring dashboard, visit the following link:
[https://smith.langchain.com/o/c12a8b7f-6f5f-4f2a-994d-fe049b3b9ab8/](https://smith.langchain.com/o/c12a8b7f-6f5f-4f2a-994d-fe049b3b9ab8/)

## Related resources

- Deploy to GCP: https://cloud.google.com/blog/products/ai-machine-learning/deploy-langchain-on-cloud-run-with-langserve
- LangSmith: https://python.langchain.com/docs/langsmith/
- LangServe: https://python.langchain.com/docs/langserve
- LangChain templates: https://github.com/langchain-ai/langchain/tree/master/templates
- 