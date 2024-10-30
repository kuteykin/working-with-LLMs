# run on AWS EC2 *G4dn.12xlarge* instance with 4x TESLA T4 GPUs with at least 51 GiB free VRAM

# Actual runtime parameters (works fine)
docker run -d --runtime nvidia --gpus all -v ~/.cache/huggingface:/root/.cache/huggingface --env "HUGGING_FACE_HUB_TOKEN=$HUGGINGFACE_API_KEY" -p 8000:8000 --ipc=host vllm/vllm-openai:latest --model casperhansen/llama-3-70b-instruct-awq --tensor-parallel-size 4 --quantization awq  --enforce-eager --disable-custom-all-reduce --gpu-memory-utilization 0.6

# # Alternative model (works fine)
# docker run -d --runtime nvidia --gpus all -v ~/.cache/huggingface:/root/.cache/huggingface --env "HUGGING_FACE_HUB_TOKEN=$HUGGINGFACE_API_KEY" -p 8000:8000  --ipc=host vllm/vllm-openai:latest --model TechxGenus/Meta-Llama-3-70B-Instruct-AWQ --tensor-parallel-size 4 --quantization awq  --enforce-eager --disable-custom-all-reduce --gpu-memory-utilization 0.6


