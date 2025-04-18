from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

@app.route('/health')
def health():
    return jsonify(status="healthy")

@app.route('/data')
def data():
    conn = mysql.connector.connect(
        host='mysql',
        user='user',
        password='password',
        database='testdb'
    )
    cursor = conn.cursor()
    cursor.execute("SELECT message FROM test")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(data=result)

app.run(host="0.0.0.0", port=4743)