from llama_cpp import Llama

llm = Llama(model_path="../Models/ggml-vicuna-7b-4bit-rev1.bin")
# Define text colors
green = "\033[0;32m"
white = "\033[0;39m"
cyan = "\033[36m"
user_input = input(">>> ")
prompt = f"Q: {user_input}. A: "
output = llm(prompt=prompt, max_tokens=128, stop=["Q:", "\n"])
print(f"\n{cyan}{output['choices'][0]['text']}\n")
