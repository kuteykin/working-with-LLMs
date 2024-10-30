# # run on AWS EC2 *G5.12xlarge* instance with 4x A10G GPUs with at least 84 GiB free VRAM

# Actual runtime parameters, everything works
docker run -d --runtime nvidia --gpus all -v ~/.cache/huggingface:/root/.cache/huggingface --env "HUGGING_FACE_HUB_TOKEN=$HUGGINGFACE_API_KEY" -p 8000:8000 --ipc=host vllm/vllm-openai:latest --model MaziyarPanahi/Mixtral-8x22B-Instruct-v0.1-AWQ --tensor-parallel-size 4 --quantization awq  --max-model-len 12000 --enforce-eager --disable-custom-all-reduce --gpu-memory-utilization 0.95