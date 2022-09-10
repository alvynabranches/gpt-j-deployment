import os
import torch
import hashlib
import logging
from datetime import datetime
from time import perf_counter
from flask import Flask, request, jsonify
from transformers import GPTJForCausalLM, AutoTokenizer

logger = logging.getLogger(__name__)
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
logger.info(f"Using device {device}")
print(f"Using device {device}")
[print(torch.cuda.get_device_properties(i)) for i in range(torch.cuda.device_count())] if torch.cuda.is_available() else print('cpu')

model_name_or_path = "EleutherAI/gpt-j-6B"
model_name_or_path = "./model/"
tokenizer_name_or_path = "EleutherAI/gpt-j-6B"

s = perf_counter()
model = GPTJForCausalLM.from_pretrained(model_name_or_path).to(device)
e = perf_counter()
logger.info(f"Model loading completed successfully! Time taken: {e-s:.3f} seconds")
print(f"Model loading completed successfully! Time taken: {e-s:.3f} seconds")

s = perf_counter()
tokenizer = AutoTokenizer.from_pretrained(tokenizer_name_or_path)
e  = perf_counter()
logger.info(f"Tokenizer loading completed successfully! Time taken: {e-s:.3f} seconds")
print(f"Tokenizer loading completed successfully! Time taken: {e-s:.3f} seconds")


def inference(
        prompt: str, model: GPTJForCausalLM, tokenizer: AutoTokenizer, 
        do_sample: bool = True, num_beam: int = None, temperature: float = None, 
        top_k: int = None, top_p: int = None, max_length: int = 128
    ) -> list:
    s = perf_counter()
    input_ids = tokenizer(prompt, return_tensors="pt").input_ids
    gen_tokens = model.generate(
        input_ids,
        do_sample=do_sample,
        num_beam=num_beam,
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
    logger.info(f"[empathy] Status checked at {datetime.now()}")
    print(f"[empathy] Status checked at {datetime.now()}")
    return jsonify({"status": "ok"}), 200


@app.route("/empathy", methods=["GET"])
def empathy():
    logger.info(f"Status of empathy checked at {datetime.now()}")
    print(f"Status of empathy checked at {datetime.now()}")
    return jsonify({"status": "ok"}), 200


@app.route("/generate", methods=["POST"])
def generate():
    # req = hashlib.md5(str(datetime.now()))
    ip = request.environ.get("HTTP_X_FORWARDED_FOR", request.environ.get("REMOTE_ADDR"))
    try:
        logger.info(f"Started inference at {datetime.now()} by {ip}")
        print(f"Started inference at {datetime.now()} by {ip}")
        data = request.get_json(silent=True)
        if "prompt" not in data:
            return jsonify({"status": "error", "message": "'prompt' not in json data"})
        num_beam = int(data["num_beam"]) if "num_beam" in data else None
        temperature = float(data["temperature"]) if "temperature" in data else None
        top_k = int(data["top_k"]) if "top_k" in data else None
        top_p = float(data["top_p"]) if "top_p" in data else None
        max_length = int(data["max_length"]) if "max_length" in data else 512
        messages = inference(
            str(data["prompt"]), model, tokenizer, max_length=max_length, 
            temperature=temperature, top_k=top_k, top_p=top_p, num_beam=num_beam
        )
        logger.info(f"Ended inference at {datetime.now()} by {ip}")
        print(f"Ended inference at {datetime.now()} by {ip}")
        return jsonify({"status": "ok", "message": messages[0]}), 201
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500


if __name__ == "__main__":
    app.run(
        host=os.environ.get("HOST", "0.0.0.0"), 
        port=os.environ.get("PORT", 5000), 
        debug=os.environ.get("DEBUG", True)
    )