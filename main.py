import os
import torch
import logging
from datetime import datetime
from time import perf_counter
from flask import Flask, request, jsonify
from transformers import GPTJForCausalLM, AutoTokenizer

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
[torch.cuda.get_device_properties(i) for i in range(torch.cuda.device_count())] if torch.cuda.is_available() else print('cpu')

model_name_or_path = "EleutherAI/gpt-j-6b"
model_name_or_path = "./model/"
tokenizer_name_or_path = "EleutherAI/gpt-j-6b"
logger = logging.getLogger(__name__)

s = perf_counter()
model = GPTJForCausalLM.from_pretrained(model_name_or_path).to(device)
e = perf_counter()
logger.info(f"Model loading completed successfully! Time taken: {e-s:.3f} seconds")

s = perf_counter()
tokenizer = AutoTokenizer.from_pretrained(tokenizer_name_or_path)
e  = perf_counter()
logger.info(f"Tokenizer loading completed successfully! Time taken: {e-s:.3f} seconds")

def inference(
        prompt: str, model: GPTJForCausalLM, tokenizer: AutoTokenizer, 
        do_sample: bool = True, num_beam: int = None, temperature: float = 0.9, 
        top_k: int = None, top_p: int = None, max_length: int = 128
    ) -> list:
    s = perf_counter()
    input_ids = tokenizer(prompt, return_tensors="pt").input_ids
    gen_tokens = model.generate(
        str(input_ids),
        do_sample=do_sample,
        temperature=temperature,
        max_length=max_length,
        top_p=top_p,
        top_k=top_k,
    )
    e = perf_counter()
    print(f"Time taken {e-s} seconds")
    logger.info(f"Time taken {e-s} seconds")
    return tokenizer.batch_decode(gen_tokens)

app = Flask(__name__)
@app.route("/", methods=["GET"])
def index():
    logger.info(f"Status checked at {datetime.now()}")
    print(f"Status checked at {datetime.now()}")
    return jsonify({"status": "ok"}), 200

@app.route("/generate", methods=["POST"])
async def generate():
    try:
        if "prompt" not in request.data:
            return jsonify({"status": "error", "message": "'prompt' not in json data"})
        messages = inference(request.data["prompt"], model, tokenizer, max_length=512)
        return jsonify({"status": "ok", "message": messages[0]}), 201
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == "__main__":
    # messages = inference("Who is Sachin Tendulkar and MS Dhoni?", model, tokenizer)
    # print(messages)
    app.run(port=os.environ.get("PORT"), debug=os.environ.get("DEBUG") == "true")