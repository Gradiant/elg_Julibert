
# ``Julibert`` Softcatalà playground of BERT models

This repository contains a dockerized API built over Julibert, Softcatalá playground of BERT models trained in catalan, for integrate it into the ELG. 

Its original code canbe found [here](https://github.com/Softcatala/julibert.)


# Usage


## Install
```
source docker-build.sh
```
## Run
```
docker run --rm -p 0.0.0.0:8866:8866 --name julibert elg_julibert:1.0.1
```

## Use

```
    curl -X POST  http://0.0.0.0:8866/predict_julibert -H 'Content-Type: application/json' -d '{"type": "text","content":"Per a Alemanya la victòria va ser important per raons històriques al vèncer la seva tradicional ‘bèstia negra’ i per a Itàlia la derrota va ser [MASK]"}'
```


Result:

```
[{'sequence': "<s>El tribunal considera provat que els acusats van costar gairebé 24 milions d'euros.</s>", 'score': 0.33576342463493347},
{'sequence': "<s>El tribunal considera provat que els acusats van invertir gairebé 24 milions d'euros.</s>", 'score': 0.06258589774370193},
{'sequence': "<s>El tribunal considera provat que els acusats van pagar gairebé 24 milions d'euros.</s>", 'score': 0.05679689720273018, 
{'sequence': "<s>El tribunal considera provat que els acusats van guanyar gairebé 24 milions d'euros.</s>", 'score': 0.03947337344288826, 
{'sequence': "<s>El tribunal considera provat que els acusats van recaptar gairebé 24 milions d'euros.</s>", 'score': 0.035779498517513275}]


```

# Test
In the folder `test` you have the files for testing the API according to the ELG specifications.
It uses an API that acts as a proxy with your dockerized API that checks both the requests and the responses.
For this follow the instructions:

1) Launch the test: `docker-compose up`

2) Make the requests, instead of to your API's endpoint, to the test's endpoint:
   ```
      curl -X POST  http://0.0.0.0:8866/processText/service -H 'Content-Type: application/json' -d '{"type": "text","content":"Per a Alemanya la victòria va ser important per raons històriques al vèncer la seva tradicional ‘bèstia negra’ i per a Itàlia la derrota va ser [MASK]"}'
   ```
3) If your request and the API's response is compliance with the ELG API, you will receive the response.
   1) If the request is incorrect: Probably you will don't have a response and the test tool will not show any message in logs.
   2) If the response is incorrect: You will see in the logs that the request is proxied to your API, that it answers, but the test tool does not accept that response. You must analyze the logs.


## Citation
The original work of this tool is:
- https://github.com/Softcatala/julibert
- Contact: Jordi Mas: jmas@softcatala.org


