import requests

def says(phrase):
    requests.post("http://pegasus.noise:5000",data={"text":phrase})

def input_loop():
    print("Send Mary a phrase!")
    while True:
        try:
            phrase = input(">>>")
            if phrase != "exit":
                says(phrase)
            else:
                break
        except KeyboardInterrupt:
            break

if __name__ == "__main__":
    input_loop()