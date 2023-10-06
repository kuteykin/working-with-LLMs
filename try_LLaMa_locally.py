from llama_cpp import Llama
import argparse


def main(args):
    llm = Llama(args.model)

    # Define text colors
    green = "\033[0;32m"
    white = "\033[0;39m"
    cyan = "\033[36m"
    print(f"{cyan}Ask a question (type 'Exit' for quit) {white}:")

    while True:
        user_input = input(">>> ")
        if user_input.lower() == "exit":
            print("Exiting...")
            break
        else:
            try:
                prompt = f"Q: {user_input}. A: "
                output = llm(
                    prompt=prompt, max_tokens=args.max_tokens, stop=["Q:", "\n"]
                )
                print(f"\n{cyan}{output['choices'][0]['text']}{white} .\n")
            except Exception as e:
                print(e)


### parsing CLI arguments ###
parser = argparse.ArgumentParser(
    description="Chat session with local LLM using llama.cpp engine, supports inference for many autonomous LLMs"
)
parser.add_argument(
    "--model",
    "-m",
    type=str,
    required=True,
    help="Path to local LLM (supports models in GGML, GGUF or GPTQ format)",
)
parser.add_argument(
    "--max_tokens", "-t", type=int, default=128, help="Number of returned tokens [int]"
)
args = parser.parse_args()

if __name__ == "__main__":
    main(args)
