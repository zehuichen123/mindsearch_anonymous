## ✨ MindSearch: Mimicking Human Minds Elicits Deep AI Searcher

## ⚽️ Build Your Own MindSearch

### Step1: Dependencies Installation

```bash
cd MindSearch
pip install -r requirements.txt
```

### Step2: Setup Environment Variables

Before setting up the API, you need to configure environment variables. Rename the `.env.example` file to `.env` and fill in the required values.

```bash
mv .env.example .env
# Open .env and add your keys and model configurations
```

### Step3: Setup MindSearch API

Setup FastAPI Server.

```bash
python -m mindsearch.app --lang en --model_format internlm_server --search_engine DuckDuckGoSearch --asy 
```

- `--lang`: language of the model, `en` for English and `cn` for Chinese.
- `--model_format`: format of the model.
  - `internlm_server` for InternLM2.5-7b-chat with local server. (InternLM2.5-7b-chat has been better optimized for Chinese.)
  - `gpt4` for GPT4.
    if you want to use other models, please modify [models](./mindsearch/agent/models.py)
- `--search_engine`: Search engine.
  - `DuckDuckGoSearch` for search engine for DuckDuckGo.
  - `BingSearch` for Bing search engine.
  - `BraveSearch` for Brave search web api engine.
  - `GoogleSearch` for Google Serper web search api engine.
  - `TencentSearch` for Tencent search api engine.
  
  Please set your Web Search engine API key as the `WEB_SEARCH_API_KEY` environment variable unless you are using `DuckDuckGo`, or `TencentSearch` that requires secret id as `TENCENT_SEARCH_SECRET_ID` and secret key as `TENCENT_SEARCH_SECRET_KEY`.
- `--asy`: deploy asynchronous agents.

## 🌐 Change Web Search API

To use a different type of web search API, modify the `searcher_type` attribute in the `searcher_cfg` located in `mindsearch/agent/__init__.py`. Currently supported web search APIs include:

- `GoogleSearch`
- `DuckDuckGoSearch`
- `BraveSearch`
- `BingSearch`
- `TencentSearch`

For example, to change to the Brave Search API, you would configure it as follows:

```python
BingBrowser(
    searcher_type='BraveSearch',
    topk=2,
    api_key=os.environ.get('BRAVE_API_KEY', 'YOUR BRAVE API')
)
```

## 🐞 Using the Backend

For users who prefer to interact with the backend directly, use the `backend_example.py` script. This script demonstrates how to send a query to the backend and process the response.

```bash
python backend_example.py
```

Make sure you have set up the environment variables and the backend is running before executing the script.

## 🐞 Debug Locally

```bash
python -m mindsearch.terminal
```