# Base image from the vllm repository
FROM vllm/vllm-openai:latest

# Set environment variables (this would be replaced with a secure token or from runtime environment)
ENV HUGGING_FACE_HUB_TOKEN="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"

EXPOSE 8000

# Create the necessary directory for Hugging Face cache if not already present
RUN mkdir -p /root/.cache/huggingface

# Set the model and parameters as default arguments (you can override them at runtime if necessary)
CMD ["--model", "meta-llama/Meta-Llama-3.1-70B-Instruct", \
     "--dtype", "bfloat16", \
     "--enforce-eager", \
     "--gpu-memory-utilization", "0.95", \
     "--max-model-len", "8128", \
     "--tensor_parallel_size", "2"]
