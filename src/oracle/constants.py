import os

HTTP_PROVIDER = os.environ.get("HTTP_PROVIDER", "https://rpc.slock.it/goerli")
CONTRACT_ADDRESS = os.environ.get("CONTRACT_ADDRESS","0x31381BB193fCE17bCDdA9f32bA1E993148eD49Ee")
ABI_PATH = os.environ.get("ABI_PATH", "")
BIN_PATH = os.environ.get("BIN_PATH", "")
TARGET_URL = os.environ.get("TARGET_URL", "https://cbr.ru/eng/key-indicators/")
