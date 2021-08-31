# How to run
Code is built and tested on **_python3_**. 
1. Install python `**requirements.txt**` file.
2. ```python
   $ export FLASK_ENV=development
   flask run
   * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
   * Debug mode: off
   * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
   127.0.0.1 - - [26/Aug/2021 10:55:41] "GET /ping HTTP/1.1" 200 -
              ```
3. Test:
   ```shell
   curl -XGET "http://localhost:5000/ping"                                                                                           
   {"message":"pong"}
    ```