# Makefile

# Define the default target
.PHONY: all
all: setup

# Setup the Python virtual environment and install dependencies
.PHONY: setup
setup:
	@echo "Setting up the Python virtual environment and installing dependencies..."
	@python -m venv venv
	@echo "Virtual environment created."
	@echo "Activating the virtual environment and installing requirements..."
	@. venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt && pip install -e llm-services/packages/*/
	@echo "Requirements installed."
	@if [ ! -f .env ]; then \
		touch env; \
		echo "\033[0;31mPlease add your OpenAI API key to the .env file.\033[0m"; \
	else \
		echo "\033[0;31m.env file already exists.\033[0m"; \
	fi

# Load environment variables
.PHONY: set_env
include .env
set_env:
	@echo "Loading environment variables..."
	@echo "OpenAI key:" $(OPENAI_API_KEY)

# Serve the application locally
.PHONY: run_local
run_local: set_env
	@echo "Serving the application locally..."
	@. venv/bin/activate && cd llm-services && langchain serve

# Deploy to cloud function
.PHONY: run_cloud
run_cloud: set_env
	@echo "Deploying to cloud function..."
	@. venv/bin/activate && cd llm-services && gcloud run deploy llm-demo --region us-east1 --set-env-vars=OPENAI_API_KEY=$(OPENAI_API_KEY)
