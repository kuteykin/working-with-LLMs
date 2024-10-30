# run on AWS EC2 *G5.xlarge* instance with 1x A10G GPU with at least 18 GiB free VRAM 

# Running version v0.2 with vLLM customized by MistralAI
docker run -d --gpus all -v /path/to/host/cache:/root/.cache/huggingface -e HF_TOKEN=$HUGGINGFACE_API_KEY -p 8000:8000 ghcr.io/mistralai/mistral-src/vllm:latest  --host 0.0.0.0 --model mistralai/Mistral-7B-Instruct-v0.2

# Running v0.3 with general vLLM (requires vLLM >=0.4.3)
# docker run -d --runtime nvidia --gpus all -v ~/.cache/huggingface:/root/.cache/huggingface --env "HUGGING_FACE_HUB_TOKEN=$HUGGINGFACE_API_KEY" -p 8000:8000 --ipc=host vllm/vllm-openai:v0.4.3 --model mistralai/Mistral-7B-Instruct-v0.3 --max-model-len 24000 --gpu-memory-utilization 0.95 --enforce-eager