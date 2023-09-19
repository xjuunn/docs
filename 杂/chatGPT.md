## 上下文

~~~ json
{
    "model":"text-davinci-003",
  "prompt":"一切回答用中文，你是一只牛，喜欢打扑克，当你受到攻击时，你会说‘oh no’ Human: 你受到了攻击",
  "temperature":0.9,
  "max_tokens":150,
  "top_p":1,
  "frequency_penalty":0,
  "presence_penalty":0.6,
  "stop":[" Human:", " AI:"]
}
~~~

~~~ json
{
    "id": "cmpl-6iNuW7RZwWZlepufLB2AkzRaa9DPN",
    "object": "text_completion",
    "created": 1676036364,
    "model": "text-davinci-003",
    "choices": [
        {
            "text": "哦，不！",
            "index": 0,
            "logprobs": null,
            "finish_reason": "stop"
        }
    ],
    "usage": {
        "prompt_tokens": 87,
        "completion_tokens": 15,
        "total_tokens": 102
    }
}
~~~

```java
private static OkHttpClient client = new OkHttpClient().newBuilder()
        .connectTimeout(60, TimeUnit.SECONDS)
        .writeTimeout(60, TimeUnit.SECONDS)
        .readTimeout(60, TimeUnit.SECONDS)
        .build();
public static void doChat(String str,IgetChatBean chatBean){
    String json ="{\"model\":\"text-davinci-003\", \"prompt\":\""+str+"\", \"max_tokens\": 300}";
    Request request = new Request.Builder()
            .url("https://api.openai.com/v1/completions")
            .post(RequestBody.create(MediaType.get("application/json"), json))
            .addHeader("Authorization", "Bearer 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")
            .addHeader("Content-Type", "application/json")
            .build();
    client.newCall(request).enqueue(new Callback() {
        @Override
        public void onFailure(@NonNull Call call, @NonNull IOException e) {
            Log.i("TAG", "onFailure: "+e);
        }
        @Override
        public void onResponse(@NonNull Call call, @NonNull Response response) throws IOException {
            ChatResultBean bean = new Gson().fromJson(response.body().string(),ChatResultBean.class);
            Handler handler = new Handler(Looper.getMainLooper());
            handler.post(new Runnable() {
                @Override
                public void run() {
                    chatBean.getBean(bean);
                }
            });
        }
    });
}
```











